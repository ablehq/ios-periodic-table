//
//  ContentView.swift
//  periodic-table
//
//  Created by Imran Mohammed on 17/09/19.
//  Copyright © 2019 Able. All rights reserved.
//

import SwiftUI
import Grid


struct ElementView: View {
  
  @State var didPress: Bool = false
  @Binding var element: Element
  
  var body: some View {
    GeometryReader {_ in
      VStack(spacing: 4) {
        if(!self.element.isInvalid()) {
          Text("\(self.element.number)")
            .font(.system(size: 8))
            .lineLimit(1)
            .foregroundColor(Color.white)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 8, alignment: .topLeading)
            .padding(4)
        }
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

      .scaleEffect(self.didPress ? 0.8 : 1)
        //    .onTapGesture {
        //      print("\(self.didPress)")
        //      self.didPress.toggle()
        //    }
        .animation(.easeInOut)
    }
    .frame(width: 70, height: 70)
    .background(Color(hex: self.element.getColor(), alpha: 1))
  }
}

struct ContentView: View {

  @Binding var elementList: Matrix<Element>
  @State var viewState = CGSize.zero

  @State var selectedElement: Element = emptyElement
  @State var showElementOverlay = false
  @State var showElementAnimation = false
  
  var body: some View {
    return GeometryReader { proxy in
      ScrollView([.horizontal], showsIndicators: false)  {
        VStack(alignment: .center, spacing: 0) {
          ForEach(0...self.elementList.rows - 1, id: \.self) { i in
            HStack(alignment: .center, spacing: 0) {
              ForEach(0...self.elementList.columns - 1, id: \.self) { j in
                ElementView(element: .constant(self.elementList[i, j]))
                  .onTapGesture {
                    self.selectedElement = self.elementList[i, j]
                    withAnimation(Animation.spring()) {
                      self.showElementOverlay.toggle()
                      self.showElementAnimation.toggle()
                    }
                }
              }
            }
          }
        }
        .frame(height: proxy.size.height)
        .edgesIgnoringSafeArea(.all)
      }
      .background(Color(hex: "#1A1F2C"))
      .overlay(

        VStack {
          if self.showElementOverlay {
            ElementDetailView(element: self.$selectedElement)
              .transition(.scale(scale: 0.0, anchor: UnitPoint(x: 1, y: 0)))
          } else {
            EmptyView()
          }
        }
      )

    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(elementList: .constant(PeriodicElementList.readJSONFromFile()?.periodicElementMatrix() ?? PeriodicElementList(elements: []).periodicElementMatrix()))
  }
}


//    for i in 0...matrix.rows - 1 {
//      var line = "|"
//      for j in 0...matrix.columns - 1 {
//        let e = matrix[i, j]
//        if e.isInvalid() {
//          line += "..."
//        } else {
//          line += matrix[i, j].symbol + "|"
//        }
//      }
//      print(line)
//    }
