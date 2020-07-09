//
//  SwiftUIView.swift
//  Memorize
//
//  Created by 李昊天 on 2020/6/14.
//  Copyright © 2020 HauTen Lee. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

