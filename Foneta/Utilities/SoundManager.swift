//
//  SoundManager.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation
import AVKit

class SoundManager {
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(_ filename: SoundAssets) {
        guard let url = Bundle.main.url(forResource: filename.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.3
            player?.prepareToPlay()
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func playAudioAsset(_ assetName : String) {
       guard let audioData = NSDataAsset(name: assetName)?.data else {
          fatalError("Unable to find asset \(assetName)")
       }

       do {
           player = try AVAudioPlayer(data: audioData)
           player?.play()
       } catch {
          fatalError(error.localizedDescription)
       }
     }
}
