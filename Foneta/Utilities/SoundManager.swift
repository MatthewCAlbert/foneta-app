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
    
    /* Channel Usage Recommendation
     * Ch 1 -> Voiceover
     * Ch 2 -> Sfx
     * Ch 3 -> Background Music
    */
    
    var playerChannelPlaying: [SoundAssets?] = [nil, nil, nil]
    var playerChannel: [AVAudioPlayer?] = [nil, nil, nil]
    
    func playSound(_ filename: SoundAssets, channel: Int = 0) {
        guard let url = Bundle.main.url(forResource: filename.rawValue, withExtension: "mp3") else { return }
        
        do {
            playerChannel[channel] = try AVAudioPlayer(contentsOf: url)
            playerChannel[channel]?.volume = 0.3
            playerChannel[channel]?.prepareToPlay()
            playerChannel[channel]?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func playAudioAsset(_ assetName : String, channel: Int = 0) {
       guard let audioData = NSDataAsset(name: assetName)?.data else {
          fatalError("Unable to find asset \(assetName)")
       }

       do {
           playerChannel[channel] = try AVAudioPlayer(data: audioData)
           playerChannel[channel]?.play()
       } catch {
          fatalError(error.localizedDescription)
       }
     }
    
    func setChannelQueuePlay(_ filename: SoundAssets?, channel: Int = 0) {
        playerChannelPlaying[channel] = filename
    }
}
