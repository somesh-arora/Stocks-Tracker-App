//
//  GlobalQuote.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

struct GlobalQuoteResponse: Codable {
  var quote: Quote
  
  private enum CodingKeys: String, CodingKey {
    case quote = "Global Quote"
  }
}
