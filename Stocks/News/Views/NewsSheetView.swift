//
//  NewsSheetView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

struct NewsSheetView: View {
  
  @Binding var newsOpen: Bool
  
  @ObservedObject var newsManager: NewsDownloadManager
  
  init(newsOpen: Binding<Bool>, newsManager: NewsDownloadManager) {
    UITableView.appearance().separatorStyle = .none
    UITableView.appearance().backgroundColor = .clear
    UITableViewCell.appearance().backgroundColor = .clear
    self._newsOpen = newsOpen
    self.newsManager = newsManager
  }
  
  var body: some View {
    BottomSheetView(isOpen: $newsOpen, maxHeight: UIScreen.main.bounds.height * 0.90) {
      
      ZStack {
        Color.white
        
        Rectangle()
          .fill(Color.black.opacity(0.8))
        
        VStack(alignment: .leading) {
          NewsHeaderView()
          Spacer()
          NewsListView(newsManager: newsManager)
        }
        .padding()
      }
    }
    .edgesIgnoringSafeArea(.vertical)
  }
}
