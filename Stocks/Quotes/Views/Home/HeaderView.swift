//
//  HeaderView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct HeaderView: View {
  
  @Binding var stocks: [String]
  @State private var showSearch = false
  
    var body: some View {
      HStack {
        titleAndDateView
        Spacer()
        addButton
      }
    }
  
  private var titleAndDateView: some View {
    VStack(alignment: .leading, spacing: 0) {
      Text("Stocks")
        .foregroundColor(.white)
        .font(.largeTitle)
        .bold()
      
      Text("\(Date(), formatter: DateFormatterManager.formatter)")
        .foregroundColor(.gray)
        .font(.title2)
    }
  }
  
  private var addButton: some View {
    Button(action: {
      showSearch.toggle()
    }) {
      Image(systemName: "plus")
        .font(.title)
        .foregroundColor(.white)
    }
    .sheet(isPresented: $showSearch) {
      self.stocks = UserDefaultsManager.shared.savedSymbols
    } content: {
      SearchView()
    }
  }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView(stocks: .constant(["AAPL", "CHPT"]))
        .previewLayout(.sizeThatFits)
        .background(Color.black)
    }
}
