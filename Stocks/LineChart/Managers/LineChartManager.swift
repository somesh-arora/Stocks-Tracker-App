//
//  LineChartManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/28/21.
//

import Foundation
import SwiftUI

final class LineChartManager: LineChartManagerProtocol, ObservableObject {
  
  @Published var lineChartData: [TimeSeriesLineChart.TimeSeriesData] = []

  func download(stocks: [String], completion: @escaping (Result<[TimeSeriesLineChart.TimeSeriesData], NetworkError>) -> Void) {
    var internalData = [TimeSeriesLineChart.TimeSeriesData]()
    let downloadQueue = DispatchQueue(label: "com.somesharora.lineChartDataDownloadQueue")
    let downloadGroup = DispatchGroup()
    
    stocks.forEach { stock in
      downloadGroup.enter()
      let url = URL(string: API.timeSeriesUrl(for: stock))!
      NetworkManager<TimeSeriesLineChart>().fetch(from: url) { result in
        switch result {
        case .failure(let error):
          print(error)
          downloadQueue.async {
            downloadGroup.leave()
          }
          
        case .success(let response):
          downloadQueue.async {
            internalData = response.timeSeriesData
            downloadGroup.leave()
          }
        }
      }
    }
    
    downloadGroup.notify(queue: DispatchQueue.global()) {
      completion(.success(internalData))
      DispatchQueue.main.async {
        self.lineChartData.append(contentsOf: internalData)
      }
    }
  }
}

