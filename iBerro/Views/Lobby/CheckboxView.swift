//
//  CheckboxView.swift
//  iBerro
//
//  Created by Danilo Araújo on 21/07/21.
//

import SwiftUI

struct CheckboxView: View {
    @State var type: CheckBoxType
    @State var list: [String]
    @Binding var selected: String
    
    var body: some View {
        HStack(spacing: 40){
            ForEach(0..<list.count, content: { index in
                Button(action: {self.selected = list[index]}, label: {
                    HStack{
                        Image(selected == list[index] ? "BgCheckboxSelected" : "BgCheckbox")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .trailing)
                        
                        Text(list[index])
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                })
            })
        }.padding(.bottom)
    }
}

enum CheckBoxType {
    case musicGender
    case maxScore
}
