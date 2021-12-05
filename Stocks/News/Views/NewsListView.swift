//
//  NewsListView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI
import BetterSafariView

struct NewsListView: View {
  
  @ObservedObject var newsManager: NewsDownloadManager
  @State private var showOnSafari = false
  @State private var selectedArticle: News?
  
  var body: some View {
    VStack {
      ScrollView(.vertical, showsIndicators: false) {
        contentView
      }
    }
  }
  
  private var contentView: some View {
    ForEach(newsManager.newsArticles) { article in
      VStack(alignment: .leading) {
        articleCellView(for: article)
        dividerView
      }
    }
  }
  
  private func articleCellView(for article: News) -> some View {
    HStack(alignment: .top) {
      titleView(for: article)
      Spacer()
      imageView(for: article)
    }
    .contentShape(Rectangle())
    .onTapGesture {
      selectedArticle = article
      showOnSafari.toggle()
    }
    .sheet(isPresented: $showOnSafari) {
      loadNews(for: selectedArticle ?? article)
    }
  }
  
  private func titleView(for article: News) -> some View {
    Text(article.title)
      .bold()
      .foregroundColor(.white)
      .fixedSize(horizontal: false, vertical: true)
  }
  
  private func imageView(for article: News) -> some View {
    AsyncImage.init(url: URL(string: article.imageUrl)!) {
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.white.opacity(0.2))
    } image: { image -> Image in
      Image(uiImage: image)
        .resizable()
    }
    .scaledToFill()
    .frame(width: 100, height: 160)
    .cornerRadius(10)
  }
  
  private var dividerView: some View {
    RoundedRectangle(cornerRadius: 2)
      .fill(Color.white.opacity(0.2))
      .frame(height: 1)
  }
  
  private func loadNews(for article: News) -> some View {
    return SafariView(url: URL(string: article.url.replacingOccurrences(of: "http://", with: "https://"))!)
  }
}
