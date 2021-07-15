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
    @State private var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    @State private var filter: String = ""
    @State private var songs = [Song]()
    @State private var player = AVPlayer()
    
    @State private var url: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                let songs = MusicAPI().searchMusic("rock")
                print(songs[0])
                
                playAudio(songs[0].previewURL)
                
            
//                self.musicPlayer.setQueue(with: [songs[0].id])
//                self.musicPlayer.prepareToPlay()
//                self.musicPlayer.play()
            }, label: {
                Text("Search")
            })
        }
//        .onAppear() {
//            SKCloudServiceController.requestAuthorization { (status) in
//                if status == .authorized {
////                    print(MusicAPI().getUserToken())
//
//                    print(status.rawValue)
//                }
//
//            }
//        }
    }
    
    func playAudio(_ url: String) {
        guard let sampleUrl = URL(string: url) else {
            return
        }
        
        let asset = AVAsset(url: sampleUrl)
        let playerItem = AVPlayerItem(asset: asset)
         player = AVPlayer(playerItem: playerItem)
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 2), queue: DispatchQueue.global(), using: { (progressTime) in
            if progressTime.seconds >= 15 {
                player.pause()
            }
            DispatchQueue.main.async {
                print(player.currentTime().seconds)
            }

        })
//        player.volume = 100
        player.actionAtItemEnd = .pause
        
        player.play()
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
