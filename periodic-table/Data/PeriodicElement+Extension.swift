//
//  PeriodicElement+Extension.swift
//  periodic-table
//
//  Created by Imran Mohammed on 12/02/20.
//  Copyright © 2020 Able. All rights reserved.
//

import Foundation
import SwiftUI

let emptyElement: Element = Element(name: "", appearance: "", atomicMass: 0, boil: 0, category: "", color: "", density: 0, discoveredBy: "", melt: 0, molarHeat: 0, namedBy: "", number: 0, period: 0, phase: .gas, source: "", spectralImg: "", summary: "", symbol: "", xpos: 0, ypos: 0, shells: [], electronConfiguration: "", electronAffinity: 0, electronegativityPauling: 0, ionizationEnergies: [])

extension PeriodicElementList {

  func periodicElementMatrix() -> Matrix<Element> {
    var elementMatrix: Matrix<Element> = Matrix(rows: 10, columns: 18, defaultValue: emptyElement)
    for e in elements {
      elementMatrix[e.ypos - 1 ,e.xpos - 1] = e
    }
    return elementMatrix
  }

}

extension Element {

  func isInvalid() -> Bool {
    return name == "" && symbol == ""
  }

  func getColor() -> String {
    switch getGroup() {
    case .diatomicNonMetal:
      return "#2F3168"
		case .polyatomicNonMetal:
      return "#2F3168"
    case .alkali:
      return "#602B39"
    case .alkaliEarth:
      return "#513E35"
    case .transistionMetal:
      return "#333E51"
    case .postTransitionMetal:
      return "#1B5643"
    case .metalloid:
      return "#154959"
    case .halogen:
      return "#424181"
    case .noble:
      return "#4A2D6D"
    case .lanthanoid:
      return "#403361"
    case .actinoid:
      return "#382349"
    default:
      return ""
    }
  }

  func getGroup() -> ElementGroup {
    switch number {
    case 1, 6, 15, 16, 34:
      return .polyatomicNonMetal
    case 7, 8:
      return .diatomicNonMetal
    case 3, 11, 19, 37, 55, 87:
      return .alkali
    case 4, 12, 20, 38, 56, 88:
      return .alkaliEarth
    case 21, 22,23, 24, 25, 26, 27, 28, 29, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 72, 73, 74, 75, 76, 77, 78, 79, 80, 104, 105, 106, 107, 108, 109, 110, 111, 112:
      return .transistionMetal
    case 13, 31, 49, 50, 81, 82, 83, 113, 114, 115, 116:
      return .postTransitionMetal
    case 5, 14, 32, 33, 51, 52, 84:
      return .metalloid
    case 9, 17, 35, 53, 85, 117:
      return .halogen
    case 2, 10, 18, 36, 54, 86, 118:
      return .noble
    case 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71:
      return .lanthanoid
    case 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103:
      return .actinoid
    default:
      return .initial
    }
  }
}

enum ElementGroup {
  case initial
  case diatomicNonMetal
  case polyatomicNonMetal
  case alkali
  case alkaliEarth
  case transistionMetal
  case postTransitionMetal
  case metalloid
  case halogen
  case noble
  case lanthanoid
  case actinoid
}
