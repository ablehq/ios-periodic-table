//
//  Color+Extension.swift
//  periodic-table
//
//  Created by Imran Mohammed on 12/02/20.
//  Copyright © 2020 Able. All rights reserved.
//

import SwiftUI

extension Color {
  init(hex: String, alpha: Double = 1) {

    if hex.isEmpty {
      self.init(red: 0 / 0xff, green: 0 / 0xff, blue: 0 / 0xff, opacity: 0.0)
      return
    } else if !hex.hasPrefix("#") {
      self.init(red: 0 / 0xff, green: 0 / 0xff, blue: 0 / 0xff, opacity: 0.0)
      return
    }

    let start = hex.index(hex.startIndex, offsetBy: 1)
   	let hexColor = String(hex[start...])

    let scanner = Scanner(string: hexColor)
    var rgbValue: UInt64 = 0
    scanner.scanHexInt64(&rgbValue)

    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff

    self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff, opacity: alpha)
  }
}
