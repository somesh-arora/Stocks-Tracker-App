//
//  SearchManager.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import Foundation

final class SearchManager: ObservableObject {
	
	@Published var searches = [Search]()
	
	func searchStocks(keyword: String) {
    guard let url = URL(string: API.symbolSearchUrl(for: keyword.trimmingCharacters(in: .whitespacesAndNewlines))) else {
      return
    }
		NetworkManager<SearchResponse>().fetch(from: url) { result in
			switch result {
			case .failure(let error):
				print(error)
			case .success(let response):
				DispatchQueue.main.async {
					self.searches = response.bestMatches
				}
			}
		}
	}
}
