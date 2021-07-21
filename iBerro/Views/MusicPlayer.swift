//
//  MusicPlayer.swift
//  iBerro
//
//  Created by Jéssica Amaral on 14/07/21.
//

import SwiftUI
import MediaPlayer
import StoreKit
import AVFoundation

struct MusicPlayer: View {
    @Binding var filter: String
    @State private var songs = [Song]()
    @State private var player = AVPlayer()
    @State private var soundLevels = [CGFloat](repeating: 5, count: numberOfSamples)
    @State private var url: String = ""

    
    @Binding var previewIsOver: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                ForEach(soundLevels, id: \.self) { level in
                    BarView(value: level)
                }
            }
        }
        .onAppear() {
            var songs = MusicAPI().searchMusic(filter)
            if songs == [] {
                songs = MusicAPI().searchMusic(filter)
            }
            playAudio(songs[0].previewURL)
        }
    }
    
    func playAudio(_ url: String) {
        guard let sampleUrl = URL(string: url) else {
            return
        }
        
        let asset = AVAsset(url: sampleUrl)
        let playerItem = AVPlayerItem(asset: asset)
        player = AVPlayer(playerItem: playerItem)
        player.seek(to: CMTime(seconds: 14, preferredTimescale: 2))
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.2, preferredTimescale: 50), queue: DispatchQueue.global(), using: { (progressTime) in
            if progressTime.seconds >= 29 {
                player.pause()
                soundLevels = [CGFloat](repeating: 5, count: numberOfSamples)
                if previewIsOver == false {
                    self.previewIsOver.toggle()
                }
                print(previewIsOver)
            } else {
                DispatchQueue.main.async {
                    for i in 0..<10{
                        let level = Float(Int.random(in: -40 ..< -30))
                        soundLevels[i] = self.normalizeSoundLevel(level: level)
                    }
                }
            }
        })
        player.actionAtItemEnd = .pause
        
        player.play()
    }
    
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
        
        return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
    }
}

