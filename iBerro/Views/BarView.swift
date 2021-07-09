//
//  BarView.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 07/07/21.
//

import SwiftUI


struct BarView: View {
    
    var value: CGFloat
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 30)
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                
                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 15) / CGFloat(numberOfSamples), height: value)
        }
    }
}


struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: CGFloat(numberOfSamples))
    }
}
