//
//  MockQuoteManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

final class MockQuoteManager: QuoteManagerProtocol, ObservableObject {
  @Published var quotes: [Quote] = []
  
  func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
    let aapl = Quote(symbol: "AAPL", open: "150.00", high: "151.11", low: "147.23", price: "150.12", volume: "1123345", previousClose: "151.10", change: "-0.26", changePrecent: "-0.19%")
    let chpt = Quote(symbol: "CHPT", open: "26.60", high: "26.81", low: "26.23", price: "26.52", volume: "323345", previousClose: "26.40", change: "0.56", changePrecent: "1.6%")
    
    for _ in 0..<2 {
      quotes.append(contentsOf: [aapl, chpt])
    }
  }
}
