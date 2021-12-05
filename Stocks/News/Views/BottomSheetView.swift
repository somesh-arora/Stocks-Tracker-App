//
//  BottomSheetView.swift
//  Stocks
//
//  Created by Somesh Arora on 11/26/21.
//

import SwiftUI

fileprivate enum Constants {
  static let indicatorSize: CGSize = CGSize(width: 60, height: 6)
  static let snapRatio: CGFloat = 0.25
  static let minHeightRatio: CGFloat = 0.2
}

struct BottomSheetView<Content: View>: View {
  
  @Binding var isOpen: Bool
  
  let maxHeight: CGFloat
  let minHeight: CGFloat
  let content: Content
  
  @GestureState private var translation: CGFloat = 0
  
  private var offset: CGFloat {
    isOpen ? 0 : maxHeight - minHeight
  }
  
  private var indicator: some View {
    RoundedRectangle(cornerRadius: 12)
      .fill(Color.white.opacity(0.2))
      .frame(width: Constants.indicatorSize.width, height: Constants.indicatorSize.height)
      .padding()
      .onTapGesture {
        isOpen.toggle()
      }
  }
  
  init(isOpen: Binding<Bool>,
       maxHeight: CGFloat,
       @ViewBuilder content: () -> Content) {
    self.maxHeight = maxHeight
    self.minHeight = maxHeight * Constants.minHeightRatio
    self.content = content()
    self._isOpen = isOpen
  }
  
  var body: some View {
    GeometryReader { reader in
      VStack(spacing: 0) {
        self.indicator
        self.content
      }
      .frame(width: reader.size.width, height: self.maxHeight, alignment: .top)
      .background(backgroundView)
      .cornerRadius(12)
      .frame(height: reader.size.height, alignment: .bottom)
      .offset(y: max(self.offset + self.translation, 0))
      .animation(.interactiveSpring())
      .gesture(DragGesture().updating(self.$translation, body: { (value, state, _) in
        state = value.translation.height
      })
                .onEnded({ value in
        let snapDistance = self.maxHeight * Constants.snapRatio
        guard abs(value.translation.height) > snapDistance else {
          return
        }
        self.isOpen = value.translation.height < 0
      }))
    }
  }
  
  private var backgroundView: some View {
    ZStack {
      Color.white
      Color.black.opacity(0.8)
    }
  }
}
