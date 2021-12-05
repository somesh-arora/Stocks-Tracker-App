//
//  LineChartManagerProtocol.swift
//  Stocks
//
//  Created by Somesh Arora on 11/28/21.
//

import Foundation

protocol LineChartManagerProtocol {
  var lineChartData: [TimeSeriesLineChart.TimeSeriesData] { get set }
  func download(stocks: [String], completion: @escaping (Result<[TimeSeriesLineChart.TimeSeriesData], NetworkError>) -> Void)
}
