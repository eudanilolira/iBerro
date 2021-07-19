//
//  MusicAPI.swift
//  iBerro
//
//  Created by Jéssica Amaral on 13/07/21.
//

import Foundation
import StoreKit

class MusicAPI {
    let devToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IjdMNzRUVEYzQTUifQ.eyJpc3MiOiJTWkRZVDlBMkQ4IiwiZXhwIjoxNjQxOTQ5MzY5LCJpYXQiOjE2MjYxODEzNjl9.HKCP6HSOnYl4hRc_cUD-18dnvWPNUFYqZtjfjxzxbiTaO1traFgv527oRDNWgNjhHFgB8iK8RI0kW3hE1oLG6g"
    func getUserToken() -> String {
        var userToken: String = ""
        let lock = DispatchSemaphore(value: 0)
        
        SKCloudServiceController().requestUserToken(forDeveloperToken: devToken) { (token, error)  in
            guard error == nil else {
                return
            }
            
            if let newToken = token {
                userToken = newToken
                lock.signal()
            } else {
                print("Não pegou user token")
                lock.signal()
            }
        }
        
        lock.wait()
        return userToken
    }
    
    func searchMusic(_ filter: String) -> [Song] {
        //"trava" a thread até que um sinal seja dado (um gatilho precisa ser ativado para continuar rodando a thread)
        let lock = DispatchSemaphore(value: 0)
        var songs = [Song]()
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/catalog/br/search?term=\(filter.replacingOccurrences(of: " ", with: "+"))&types=songs&limit=1")!
        
//        let userToken = self.getUserToken()
//        print(userToken)
        var request = URLRequest(url: musicURL)
        request.httpMethod = "GET"
        request.addValue("Bearer \(devToken)", forHTTPHeaderField: "Authorization")
//        request.addValue(userToken, forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            
            if let json = try? JSON(data: data!) {
                print (json)
                let songList = (json["results"]["songs"]["data"]).array ?? []
                
                for song in songList {
                    let songInfos = song["attributes"]
                    let songPreviews = songInfos["previews"].array!
                    let newSong = Song(id: songInfos["playParams"]["id"].string!, hasLyrics: songInfos["hasLyrics"].bool!, previewURL: songPreviews[0]["url"].string!, lyrics: "")
                    songs.append(newSong)
                }
                
                lock.signal()
                
            } else {
                lock.signal()
            }
        }.resume()
        
        lock.wait()
        
        return songs
    }
}
