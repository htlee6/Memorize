//
//  Array+Indentifiable.swift
//  Memorize
//
//  Created by 李昊天 on 2020/6/14.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import Foundation

// constraints and gains
extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? { // Return type is NOT Int rather than Optional<Int>
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        // If not found
        return nil
    }
}
