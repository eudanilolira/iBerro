//
//  Song.swift
//  iBerro
//
//  Created by Jéssica Amaral on 13/07/21.
//

import Foundation

struct Song {
    var id: String
    var hasLyrics: Bool
    var previewURL: String
    var lyrics: String
    
    init(id: String, hasLyrics: Bool, previewURL: String, lyrics: String) {
        self.id = id
        self.lyrics = lyrics
        self.hasLyrics = hasLyrics
        self.previewURL = previewURL
    }
}
