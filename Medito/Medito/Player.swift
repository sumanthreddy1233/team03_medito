//
//  Player.swift
//  Medito
//
//  Created by Student on 11/11/20.
//

import Foundation
import MediaPlayer

class Player{
    var avPlayer = AVPlayer()
    
    init(){
        avPlayer = AVPlayer()
    }
    
    func playStream(fileUrl: String){
        let url = NSURL(string: fileUrl)
        
        avPlayer = AVPlayer(url: url! as URL)
        avPlayer.play()
        setPlayingScreen(fileUrl: fileUrl)
        print("playing stream")
    }
    
    func setPlayingScreen(fileUrl: String){
        let urlArray = fileUrl.characters.split{
            $0 == "/"
        }.map(String.init)
        let name = urlArray[urlArray.endIndex - 1]
        print(name)
        let songInfo = [MPMediaItemPropertyTitle: "song", MPMediaItemPropertyArtist: "DJ DEEKSHITH"]
        MPNowPlayingInfoCenter.default().nowPlayingInfo = songInfo
    }
}
