//
//  Quote.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

struct Quote: Codable {
  var symbol: String
  var open: String
  var high: String
  var low: String
  var price: String
  var volume: String
  var previousClose: String
  var change: String
  var changePrecent: String
  
  private enum CodingKeys: String, CodingKey {
    case symbol = "01. symbol"
    case open = "02. open"
    case high = "03. high"
    case low = "04. low"
    case price = "05. price"
    case volume = "06. volume"
    case previousClose = "08. previous close"
    case change = "09. change"
    case changePrecent = "10. change percent"
  }
}

extension Quote: Identifiable {
  var id: UUID {
    return UUID()
  }
}

/*
 {
     "Global Quote": {
         "01. symbol": "IBM",
         "02. open": "115.0000",
         "03. high": "116.3350",
         "04. low": "114.5600",
         "05. price": "115.8100",
         "06. volume": "3322012",
         "07. latest trading day": "2021-11-26",
         "08. previous close": "116.7300",
         "09. change": "-0.9200",
         "10. change percent": "-0.7881%"
     }
 }
 */
