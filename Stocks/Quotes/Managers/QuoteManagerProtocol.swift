//
//  QuoteManagerProtocol.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

protocol QuoteManagerProtocol {
  var quotes: [Quote] { get set}
  func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
