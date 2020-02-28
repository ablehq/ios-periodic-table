//
//  Matrix.swift
//  periodic-table
//
//  Created by Imran Mohammed on 12/02/20.
//  Copyright © 2020 Able. All rights reserved.
//

import Foundation

struct Matrix<T> {
  let rows: Int, columns: Int
  var grid: [T]
  init(rows: Int, columns: Int,defaultValue: T) {
    self.rows = rows
    self.columns = columns
    grid = Array(repeating: defaultValue, count: rows * columns)
  }
  func indexIsValid(row: Int, column: Int) -> Bool {
    return row >= 0 && row < rows && column >= 0 && column < columns
  }
  subscript(row: Int, column: Int) -> T {
    get {
      assert(indexIsValid(row: row, column: column), "Index out of range")
      return grid[(row * columns) + column]
    }
    set {
      assert(indexIsValid(row: row, column: column), "Index out of range")
      grid[(row * columns) + column] = newValue
    }
  }
}
