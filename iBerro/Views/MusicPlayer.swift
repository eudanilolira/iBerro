//
//  MusicPlayer.swift
//  iBerro
//
//  Created by Jéssica Amaral on 14/07/21.
//

import SwiftUI
import MediaPlayer
import StoreKit

struct MusicPlayer: View {
    @State private var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    @State private var filter: String = ""
    @State private var songs = [Song]()
    
    var body: some View {
        VStack {
            TextField("Buscar por: ", text: $filter)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            Button(action: {
                let songs = MusicAPI().searchMusic(filter)
                print(songs[0])
            
                self.musicPlayer.setQueue(with: [songs[0].id])
                self.musicPlayer.prepareToPlay()
                print(musicPlayer.nowPlayingItem?.lyr)
                self.musicPlayer.play()
            }, label: {
                Text("Search")
            })
        } .onAppear() {
            SKCloudServiceController.requestAuthorization { (status) in
                if status == .authorized {
//                    print(MusicAPI().getUserToken())
                    
                    print(status.rawValue)
                }
                
            }
        }
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
