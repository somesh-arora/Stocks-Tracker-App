//
//  Array+Extensions.swift
//  Stocks
//
//  Created by Somesh Arora on 11/27/21.
//

import Foundation

extension Array where Element: Hashable {
  func difference(from other: [Element]) -> [Element] {
    let thisSet = Set(self)
    let otherSet = Set(other)
    return Array(thisSet.symmetricDifference(otherSet))
  }
}
