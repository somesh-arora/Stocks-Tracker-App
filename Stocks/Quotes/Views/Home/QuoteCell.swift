//
//  QuoteCell.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct QuoteCell: View {
  
  var quote: Quote
  var lineChartData: TimeSeriesLineChart.TimeSeriesData
  
    var body: some View {
      HStack {
        tickerSymbolView
        Spacer()
        stockLineChartView
        Spacer()
        stockPriceView
      }
    }
  
  private var stockPriceView: some View {
    VStack(spacing: 5) {
      currentPriceView
      priceChangeView
    }
    .frame(width: 100)
  }
  
  private var tickerSymbolView: some View {
    Text(quote.symbol)
      .font(.body)
      .bold()
  }
  
  private var stockLineChartView: some View {
    LineChart(values: quote)
      .fill(
        LinearGradient(
          gradient: Gradient(colors: [.green.opacity(0.7), .green.opacity(0.2), .green.opacity(0.0)]), startPoint: .top, endPoint: .bottom
        )
      )
      .frame(width: 150, height: 50)
  }
  
  private var currentPriceView: some View {
    Text(quote.price)
      .font(.callout)
      .bold()
  }
  
  private var priceChangeView: some View {
    Text(quote.change)
      .padding(.horizontal)
      .frame(width: 100)
      .background(
        RoundedRectangle(cornerRadius: 5)
          .fill(priceChangeBackgroundView)
        )
  }
  
  private var priceChangeBackgroundView: Color {
    if let priceChange = Double(quote.change), priceChange > 0.0 {
      return Color.green
    } else {
      return Color.red
    }
  }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
      QuoteCell(quote: Quote(symbol: "AAPL", open: "150.00", high: "151.11", low: "147.23", price: "150.12", volume: "1123345", previousClose: "151.10", change: "-0.26", changePrecent: "-0.19%"))
        .previewLayout(.sizeThatFits)
    }
}
