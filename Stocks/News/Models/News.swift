//
//  News.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

struct News: Codable {
  var title: String
  var url: String
  var urlToImage: String?
  var imageUrl: String {
    return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://www.macobserver.com/wp-content/uploads/2019/09/workfeatured-apple-news-4.png"
  }
}

extension News: Identifiable {
  var id: UUID {
    return UUID()
  }
}
