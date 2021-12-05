//
//  NewsDownloadManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import Foundation

class NewsDownloadManager: ObservableObject {
  @Published var newsArticles = [News]()

  private let newsUrlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&sortBy=popularity&apiKey=\(NewsAPI.key)"

  init() {
    download()
  }
  
  func download() {
    NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!) { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let response):
        DispatchQueue.main.async {
          self.newsArticles = response.articles
        }
      }
    }
  }
}
