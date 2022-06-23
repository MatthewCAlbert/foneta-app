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

    func speakSomething(text: String, rate: Float = 0.3, volume: Float = 1.0) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "id-ID")
        utterance.rate = rate
        utterance.volume = volume

        self.speechSynthesizer.stopSpeaking(at: .immediate)
        self.speechSynthesizer.speak(utterance)
    }
}

extension TextToSpeech: AVSpeechSynthesizerDelegate {

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    }
    // swiftlint:disable:next line_length
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
    }

}
