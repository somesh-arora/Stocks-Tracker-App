//
//  MiniQuoteView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct MiniQuoteView: View {
  
//  @ObservedObject var stockQuotes: StockQuoteManager
  @ObservedObject var stockQuotes: MockQuoteManager
  
    var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(stockQuotes.quotes) { quote in
            quoteView(for: quote)
          }
        }
      }
    }
  
  private func quoteView(for quote: Quote) -> some View {
    VStack(spacing: 4) {
      Text(quote.symbol)
        .font(.subheadline)
        .bold()
      
      Text(quote.price)
        .font(.subheadline)
      
      Text(quote.change)
        .font(.subheadline)
        .padding(.horizontal)
        .frame(width: 100)
        .background(
          RoundedRectangle(cornerRadius: 5)
            .fill(priceChangeBackgroundView(priceChange: quote.change)), alignment: .trailing
        )
    }
    .background(backgroundView)
    .foregroundColor(.white)
  }
  
  private var backgroundView: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(Color.white.opacity(0.2))
  }
  
  private func priceChangeBackgroundView(priceChange: String) -> Color {
    if let priceChange = Double(priceChange), priceChange > 0.0 {
      return Color.green
    } else {
      return Color.red
    }
  }
}
