//
//  API.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

struct API {
  static var baseUrl: String {
    return "https://www.alphavantage.co/query?"
  }
  
  enum SymbolFunction: String {
    case search = "SYMBOL_SEARCH"
    case quote = "GLOBAL_QUOTE"
    case timeSeriesIntraday = "TIME_SERIES_INTRADAY"
  }
  
  static func symbolSearchUrl(for searchKey: String) -> String {
    return urlBy(symbol: .search, searchKey: searchKey)
  }
  
  static func quoteUrl(for searchKey: String) -> String {
    return urlBy(symbol: .quote, searchKey: searchKey)
  }
  
  static func timeSeriesUrl(for searchKey: String) -> String {
    return urlBy(symbol: .timeSeriesIntraday, searchKey: searchKey)
  }
  
  private static func urlBy(symbol: SymbolFunction, searchKey: String) -> String {
    switch symbol {
    case .search:
      return "\(baseUrl)function=\(symbol.rawValue)&keywords=\(searchKey)&apikey=\(key)"
    case .quote:
      return "\(baseUrl)function=\(symbol.rawValue)&symbol=\(searchKey)&apikey=\(key)"
    case .timeSeriesIntraday:
      return "\(baseUrl)function=\(symbol.rawValue)&symbol=\(searchKey)&interval=5min&apikey=\(key)"
    }
  }
}

extension API {
  static var key: String {
    return "6EDLAVJSAED8YR42"
  }
}

// Quote
// https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo

// Time series intraday
// https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=demo
