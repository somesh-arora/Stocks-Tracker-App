//
//  SearchTextView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct SearchTextView: View {
  
  @Binding var searchTerm: String
  
    var body: some View {
      CustomTextField(placeholder: placeholderView, text: $searchTerm)
        .foregroundColor(.white)
        .padding(.leading, 40)
        .frame(height: 40)
        .background(backgroundView)
    }
  
  private var backgroundView: some View {
    ZStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: 5)
        .fill(Color.gray.opacity(0.6))
      
      Image(systemName: "magnifyingglass")
        .foregroundColor(Color.gray)
        .padding(.leading, 10)
    }
  }
  
  private var placeholderView: Text {
    Text("Search")
      .foregroundColor(Color.gray)
  }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
      SearchTextView(searchTerm: .constant("Microsoft"))
        .previewLayout(.sizeThatFits)
        .background(Color.black)
    }
}
