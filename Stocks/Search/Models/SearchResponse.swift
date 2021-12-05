//
//  SearchResponse.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import Foundation

struct SearchResponse: Codable {
  var bestMatches: [Search]
  
  private enum CodingKeys: String, CodingKey {
    case bestMatches = "bestMatches"
  }
}
