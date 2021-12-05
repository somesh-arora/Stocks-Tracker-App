//
//  StockQuoteManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

final class StockQuoteManager: QuoteManagerProtocol, ObservableObject {
  
  @Published var quotes: [Quote] = []
  
  func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
    var internalQuotes = [Quote]()
    let downloadQueue = DispatchQueue(label: "com.somesharora.downloadQueue")
    let downloadGroup = DispatchGroup()
    
    stocks.forEach { stock in
      downloadGroup.enter()
      let url = URL(string: API.quoteUrl(for: stock))!
      NetworkManager<GlobalQuoteResponse>().fetch(from: url) { result in
        switch result {
        case .failure(let error):
          print(error)
          downloadQueue.async {
            downloadGroup.leave()
          }
          
        case .success(let response):
          downloadQueue.async {
            internalQuotes.append(response.quote)
            downloadGroup.leave()
          }
        }
      }
    }
    
    downloadGroup.notify(queue: DispatchQueue.global()) {
      completion(.success(internalQuotes))
      DispatchQueue.main.async {
        self.quotes.append(contentsOf: internalQuotes)
      }
    }
    
  }
}
