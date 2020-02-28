//
//  ElementDetailView.swift
//  periodic-table
//
//  Created by Imran Mohammed on 19/02/20.
//  Copyright © 2020 Able. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ElementDetailView: View {

  @Binding var element: Element
  @State private var dragAmount: CGSize = .zero
  @State private var isDragging: Bool = false
  @State private var scaleAmount: CGFloat = 1

  @State var viewHeight: CGFloat = 0
  @State var viewMinHeight: CGFloat = 0

  var body: some View {
    GeometryReader { reader in
      VStack(spacing: 4) {
        WebImage(url: URL(string: self.element.spectralImg ?? "https://images.unsplash.com/photo-1581924374753-1dd12d051619?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"))
          .resizable()
          .background(Color.yellow)
          .frame(width: reader.size.width, height: 200)
        Text(self.element.symbol)
          .font(.system(size: 26))
          .bold()
          .foregroundColor(Color.white)
          .lineLimit(1)
        Text(self.element.name)
          .font(.system(size: 8))
          .lineLimit(1)
          .foregroundColor(Color.white)
      }
      .onAppear {
        self.viewHeight = reader.size.height
        self.viewMinHeight = self.viewHeight * 0.0
      }
    }
    .background(Color(hex: self.element.getColor(), alpha: 1))
    .offset(self.dragAmount)
    .scaleEffect(self.isDragging ? scaleAmount : 1)
    .gesture(
      DragGesture()
        .onChanged { value in
          self.dragAmount = value.translation
          self.isDragging = true

          let toHeight = self.viewMinHeight + (1 - (min(self.dragAmount.height * -1, self.viewHeight) / self.viewHeight)) * (self.viewHeight - self.viewMinHeight)
          let toScale = self.viewHeight / toHeight
          self.scaleAmount = toScale < 1 ? toScale : 1
      }
      .onEnded { value in
        withAnimation(.spring()) {
          self.dragAmount = .zero
          self.isDragging = false
          self.scaleAmount = 1
        }

    })
  }
}


struct ElementDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ElementDetailView(element: .constant(PeriodicElementList.readJSONFromFile()?.elements[0] ?? emptyElement))
  }
}

