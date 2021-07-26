//
//  UIGrid.swift
//  Memorize
//
//  Created by Julia Machado on 20/07/21.
//

import SwiftUI

struct UIGrid<Content: View, A: Identifiable >: View {
    
    @Binding var showInviteModal: Bool
    @Binding var showInviteButton: Bool
    private let columns: Int
    private var list: [[A]] = []
    private let content: (A) -> Content
    
    
    init(showInviteButton: Binding<Bool>, showInviteModal: Binding<Bool>, columns: Int, list: [A], @ViewBuilder content: @escaping (A) -> Content){
        self._showInviteModal = showInviteModal
        self._showInviteButton = showInviteButton
        self.columns = columns
        self.content = content
        self.setup(list: list)
        
    }
    
    var body: some View {
        VStack {
            ForEach(0 ..< self.list.count, id: \.self) { i  in
                HStack(spacing: 10) {
                    ForEach(0..<self.list[i].count, id: \.self) { j in
                        self.content(self.list[i][j])
                        
                        if((i == self.list.count - 1) && (j == self.list[i].count - 1) && showInviteButton){
                            Button(action: {self.showInviteModal = true}, label: {
                                VStack {
                                    Image("Convidar")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    
                                    Text("Invite friend".localized())
                                        .font(.system(size: 24))
                                        .foregroundColor(.white)
                                        .fontWeight(.regular)
                                        .multilineTextAlignment(.center)
                                        .padding([.leading,.trailing])
                                }
                                
                            })
                        }
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
