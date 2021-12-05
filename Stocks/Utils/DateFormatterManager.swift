//
//  DateFormatterManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import Foundation

final class DateFormatterManager {
  static let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd"
    return formatter
  }()
}

