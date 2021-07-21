//
//  UIGrid.swift
//  Memorize
//
//  Created by Julia Machado on 20/07/21.
//

import SwiftUI

struct UIGrid<Content: View, A: Identifiable >: View {
    
    private let columns: Int
    private var list: [[A]] = []
    private let content: (A) -> Content
    
    init(columns: Int, list: [A], @ViewBuilder content: @escaping (A) -> Content){
        self.columns = columns
        self.content = content
        self.setup(list: list)
    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< self.list.count, id: \.self) { i  in
                HStack {
                    ForEach(self.list[i]) { object in
                        self.content(object)
                    }
                }
            }
        }
    }
    
    private mutating func setup(list: [A]){
        var column = 0
        var row = 0
        
        for item in list {
            if row < self.columns {
                if row == 0 {
                    self.list.insert([item], at: column)
                    row += 1
                } else {
                    self.list[column].append(item)
                    row += 1
                }
            } else {
                column += 1
                self.list.insert([item], at: column)
                row = 1
            }
        }
    }
    
}
