//
//  ContentView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct ContentView: View {
  
//  @ObservedObject var stockManager = StockQuoteManager()
  @ObservedObject var stockManager = MockQuoteManager() //StockQuoteManager()
  @ObservedObject var lineChartManager = LineChartManager()
  
  @ObservedObject var newsManager = NewsDownloadManager()
  
  @State private var stocks = UserDefaultsManager.shared.savedSymbols
  
  @State private var searchTerm = ""
  
  @State private var newsOpen = false
  
  @State private var oldStocks = [String]()
  
  init() {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = .clear
    UITableViewCell.appearance().backgroundColor = .clear
  }
  
    var body: some View {
      ZStack {
        Color.black
        
        VStack(alignment: .leading) {
          if newsOpen {
            withAnimation {
              MiniQuoteView(stockQuotes: stockManager)
                .foregroundColor(.white)
                .padding(.top, 50)
                .frame(height: newsOpen ? 100 : 0)
                .transition(.move(edge: .top))
            }
          } else {
            withAnimation {
              HeaderView(stocks: $stocks)
                .padding(.top, 50)
                .frame(height: newsOpen ? 0 : 100)
                .transition(.move(edge: .top))
            }
          }
          
          List {
            Group {
              SearchTextView(searchTerm: $searchTerm)
              
              ForEach(getQuotes()) { quote in
                let quote =
                QuoteCell(quote: quote)
              }
            }
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets())
          }
          .onAppear(perform: {
            fetchData(for: stocks)
            fetchLineChartData(for: stocks)
            oldStocks = stocks
          })
          .onChange(of: stocks) { newValue in
            fetchData(for: stocks.difference(from: oldStocks))
            fetchLineChartData(for: stocks.difference(from: oldStocks))
            oldStocks = stocks
          }
          .listStyle(PlainListStyle())
          .foregroundColor(.white)
        }
        .padding(.horizontal, 32)
        .padding(.bottom, UIScreen.main.bounds.height * 0.21)
        
        NewsSheetView(newsOpen: $newsOpen, newsManager: newsManager)
      }
      .edgesIgnoringSafeArea(.all)
    }
  
  private func getQuotes() -> [Quote] {
    return searchTerm.isEmpty ? stockManager.quotes : stockManager.quotes.filter { $0.symbol.lowercased().contains(searchTerm.lowercased()) }
  }
  
  private func getLineChartData() -> [TimeSeriesLineChart.TimeSeriesData] {
    return lineChartManager.lineChartData
  }
  
  private func fetchData(for symbols: [String]) {
    stockManager.download(stocks: symbols) { _ in
    }
  }
  
  private func fetchLineChartData(for symbols: [String]) {
    lineChartManager.download(stocks: symbols) { _ in
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
