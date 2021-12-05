//
//  SearchView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import SwiftUI

struct SearchView: View {
  
  @State private var searchTerm: String = ""
  @ObservedObject var searchManager = SearchManager()
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.8)
      
      VStack(spacing: 5) {
       headerView
        Spacer()
        contentView
      }
      .padding(.top, 40)
      .padding(.horizontal, 16)
    }
    .edgesIgnoringSafeArea(.all)
  }
  
  private var contentView: some View {
    ScrollView(.vertical, showsIndicators: false) {
      ForEach(searchManager.searches) { item in
        searchItemView(for: item)
        dividerView
      }
    }
  }
  
  private func searchItemView(for item: Search) -> some View {
    HStack {
      VStack(alignment: .leading) {
        Text(item.symbol)
          .font(.title)
          .bold()
        
        Text(item.type)
          .font(.callout)
      }
      
      Spacer()
      
      Text(item.name)
      
      Spacer()
      
      Button(action: {UserDefaultsManager.shared.set(symbol: item.symbol)}) {
        Image(systemName: "plus.circle")
          .font(.title2)
      }
    }
    .foregroundColor(.white)
  }
  
  private var headerView: some View {
    HStack {
      SearchTextView(searchTerm: $searchTerm)
      goButtonView
    }
  }
  
  private var goButtonView: some View {
    Button(action: { searchManager.searchStocks(keyword: searchTerm) }) {
      Image(systemName: "arrow.right.circle")
        .font(.title2)
        .foregroundColor(.white)
    }
  }
  
  private var dividerView: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(.gray)
      .frame(height: 0.5)
  }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
