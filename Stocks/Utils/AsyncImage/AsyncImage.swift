//
//  AsyncImage.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import SwiftUI

struct AsyncImage<PlaceholderView: View>: View {
  @StateObject private var loader: ImageLoader
  
  private let placeholder: PlaceholderView
  private let image: (UIImage) -> Image
  
  init(url: URL, @ViewBuilder placeholder: () -> PlaceholderView, @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)) {
    self.placeholder = placeholder()
    self.image = image
    _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
  }
  
  var body: some View {
    content
      .onAppear(perform: loader.load)
  }
  
  private var content: some View {
    Group {
      if loader.image != nil {
        image(loader.image!)
      } else {
        placeholder
      }
    }
  }
}
