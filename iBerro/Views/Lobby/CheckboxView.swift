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
    @State var isChecked: Bool = false
    var body: some View {
        HStack(spacing: 60){
            ForEach(0..<list.count, content: { index in
                Button(action: {isChecked.toggle()}, label: {
                    HStack{
                        Image(isChecked ? "BgCheckbox" : "BgCheckboxSelected")
                            .resizable()
                            .frame(width: 60, height: 60, alignment: .trailing)
                        
                        Text(list[index])
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                })
            })
        }.frame(width: 900, height: 184, alignment: .center)
    }
}

enum CheckBoxType {
    case musicGender
    case maxScore
}

//struct CheckboxView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckboxView()
//    }
//}
