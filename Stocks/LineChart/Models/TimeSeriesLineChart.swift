//
//  TimeSeriesLineChart.swift
//  Stocks
//
//  Created by Somesh Arora on 11/28/21.
//

import Foundation

struct TimeSeriesLineChart: Codable {
  let metaData: MetaData
  let timeSeriesData: [String: TimeSeriesData]
  
  var closeValues: [Double] {
    let rawValues = timeSeriesData.values.map { Double($0.close) }
    let minValue = rawValues.min()
    let maxValue = rawValues.max()
    
    return rawValues.map { $0 - min * 0.95 / (max - min * 0.95) }
  }
  
  private enum CodingKets: String, CodingKey {
    case metaData = "Meta Data"
    case timeSeriesData = "Time Series (5min)"
  }
  
  struct MetaData: Codable {
    let information: String
    let symbol: String
    let lastRefreshed: String
    let interval: String
    let outputSize: String
    let timezone: String
    
    private enum CodingKeys: String, CodingKey {
      case information = "1. Information"
      case symbol = "2. Symbol"
      case lastRefreshed = "3. Last Refreshed"
      case interval = "4. Interval"
      case outputSize = "5. Output Size"
      case timezone = "6. Time Zone"
    }
  }
  
  struct TimeSeriesData: Codable {
    let open: String
    let high: String
    let low: String
    let close: String
    let volume: String
    
    private enum CodingKeys: String, CodingKey {
      case open = "1. open"
      case high = "2. high"
      case low = "3. low"
      case close = "4. close"
      case volume = "5. volume"
    }
  }
}

extension TimeSeriesLineChart: Identifiable {
  var id: UUID {
    return UUID()
  }
}

/*
 "Meta Data": {
 "1. Information": "Intraday (5min) open, high, low, close prices and volume",
 "2. Symbol": "IBM",
 "3. Last Refreshed": "2021-11-26 16:25:00",
 "4. Interval": "5min",
 "5. Output Size": "Compact",
 "6. Time Zone": "US/Eastern"
 },
 */

/*
 "Time Series (5min)": {
 "2021-11-26 16:25:00": {
 "1. open": "115.6800",
 "2. high": "115.6800",
 "3. low": "115.6800",
 "4. close": "115.6800",
 "5. volume": "174"
 },
 "2021-11-26 16:15:00": {
 "1. open": "115.6500",
 "2. high": "115.6500",
 "3. low": "115.6500",
 "4. close": "115.6500",
 "5. volume": "156"
 },
 */
