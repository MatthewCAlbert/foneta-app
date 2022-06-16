//
//  TextToSpeech.swift
//  Foneta
//
//  Created by Matthew Christopher Albert on 16/06/22.
//

import Foundation
import AVFoundation

class TextToSpeech: NSObject, ObservableObject {
    private var speechSynthesizer = AVSpeechSynthesizer()
    
    override init() {
        super.init()
        self.speechSynthesizer.delegate = self
    }
    
    func speakSomething(text: String, rate: Double = 0.3, volume: Double = 1.0) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "id-ID")
        utterance.rate = 0.3
        utterance.volume = 1.0

        self.speechSynthesizer.speak(utterance)
    }
}

extension TextToSpeech: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("speaking")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("paused")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        print("continued")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("cancelled")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("finished")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        print("\(characterRange)")
    }
    
}
