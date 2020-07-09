//
//  Array+Only.swift
//  Memorize
//
//  Created by 李昊天 on 2020/7/5.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
