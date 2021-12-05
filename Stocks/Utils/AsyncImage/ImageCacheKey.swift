//
//  ImageCacheKey.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
  static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
  var imageCache: ImageCache {
    get { self[ImageCacheKey.self] }
    set {self[ImageCacheKey.self] = newValue }
  }
}
