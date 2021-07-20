//
//  LoadingView.swift
//  iBerro
//
//  Created by Danilo Araújo on 14/07/21.
//

import SwiftUI

struct LoadingView: View {
    @State private var soundLevels = [CGFloat](repeating: 5, count: 5)
    
    
    var body: some View {
        ZStack {
            Image("BgMenu")
                .resizable()
            
            VStack {
                HStack{
                    ForEach(soundLevels, id: \.self) { level in
                        BarView(value: level)
                    }
                }.frame(width: 200, height: 130, alignment: .center).padding()
                
                Text("Carregando.....").font(.title).foregroundColor(.white)
                    
                
            }.onAppear(){
                for i in 0..<5{
                    let level = Float(Int.random(in: -40 ..< -30))
                    soundLevels[i] = self.normalizeSoundLevel(level: level)
                }
            }
        }.ignoresSafeArea()
    }
    
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
        
        return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}


