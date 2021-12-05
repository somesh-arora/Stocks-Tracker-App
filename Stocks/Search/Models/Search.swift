//
//  Search.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import Foundation

struct Search: Codable {
  var symbol: String
  var name: String
  var type: String
  
  private enum CodingKeys: String, CodingKey {
    case symbol = "1. symbol"
    case name = "2. name"
    case type = "3. type"
  }
}

extension Search: Identifiable {
  var id: UUID {
    return UUID()
  }
}

/*
 {
     "bestMatches": [
         {
             "1. symbol": "TSCO.LON",
             "2. name": "Tesco PLC",
             "3. type": "Equity",
             "4. region": "United Kingdom",
             "5. marketOpen": "08:00",
             "6. marketClose": "16:30",
             "7. timezone": "UTC+00",
             "8. currency": "GBX",
             "9. matchScore": "0.7273"
         },
         {
             "1. symbol": "TSCDF",
             "2. name": "Tesco plc",
             "3. type": "Equity",
             "4. region": "United States",
             "5. marketOpen": "09:30",
             "6. marketClose": "16:00",
             "7. timezone": "UTC-04",
             "8. currency": "USD",
             "9. matchScore": "0.7143"
         },
         {
             "1. symbol": "TSCDY",
             "2. name": "Tesco plc",
             "3. type": "Equity",
             "4. region": "United States",
             "5. marketOpen": "09:30",
             "6. marketClose": "16:00",
             "7. timezone": "UTC-04",
             "8. currency": "USD",
             "9. matchScore": "0.7143"
         }
     ]
 }
 */
