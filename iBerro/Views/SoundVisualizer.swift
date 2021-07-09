//
//  SoundVisualizer.swift
//  iBerro
//
//  Created by Pedro Henrique Spínola de Assis on 07/07/21.
//

import SwiftUI

let numberOfSamples: Int = 10

struct SoundVisualizer: View {
    
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
        
        // 2
        private func normalizeSoundLevel(level: Float) -> CGFloat {
            let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
            
            return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
        }
        
        var body: some View {
            VStack {
                 // 3
                HStack(spacing: 4) {
                     // 4
                    ForEach(mic.soundSamples, id: \.self) { level in
                        BarView(value: self.normalizeSoundLevel(level: level))
                    }
                }
            }
        }
    }


struct SoundVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        BarView(value: CGFloat(numberOfSamples))
    }
}
