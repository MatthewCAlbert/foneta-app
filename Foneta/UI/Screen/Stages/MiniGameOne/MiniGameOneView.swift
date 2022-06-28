//
//  MiniGameOneView.swift
//  Foneta
//
//  Created by Rahmat Afriyanton on 26/06/22.
//

import SwiftUI

struct MiniGameOneView: View {
    var nextScreenId: String?

	@State private var letters = [
		Letter(letterName: "a"),
		Letter(letterName: "b"),
		Letter(letterName: "c"),
		Letter(letterName: "d"),
		Letter(letterName: "e"),
		Letter(letterName: "f"),
		Letter(letterName: "g"),
		Letter(letterName: "h"),
		Letter(letterName: "i"),
		Letter(letterName: "j"),
		Letter(letterName: "k"),
		Letter(letterName: "l"),
		Letter(letterName: "m"),
		Letter(letterName: "n"),
		Letter(letterName: "o"),
		Letter(letterName: "p"),
		Letter(letterName: "q"),
		Letter(letterName: "r"),
		Letter(letterName: "s"),
		Letter(letterName: "t"),
		Letter(letterName: "u"),
		Letter(letterName: "v"),
		Letter(letterName: "w"),
		Letter(letterName: "x"),
		Letter(letterName: "y"),
		Letter(letterName: "z")
	]

	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var nextSceneActive = false
	@State private var countDown = 3
	@State private var isFinishedCountdown = false
	@State private var isFinishedPlaying = false

	@State var displayedLetter: [DisplayedLetters] = []
	@State var numberOfDisplayedLetter = 0
	@State var lastDisplayedLetter = 0

    func finishGame() {
        SoundManager.shared.playerChannel[2]?.stop()
        isFinishedPlaying = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            nextSceneActive = true
        }
    }

	var body: some View {
		GeometryReader { geo in
			ZStack {
				FullBackgroundImage(image: "Screen5-Bg")
				FullBackgroundImage(image: "Screen5-CoralReef")

				VStack {
					HStack {
						if (!isFinishedCountdown && !isFinishedPlaying) {
							Text(countDown > 0 ? "\( countDown)" : "Mulai")
                                .font(Font.custom(AppFont.openDyslexic.rawValue, size: 150))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
								.onAppear {
                                    SoundManager.shared.playSound(SoundAssets.tiga)
									Timer
                                        .scheduledTimer(withTimeInterval: 1.1, repeats: true) { (timer) in
											countDown -= 1
											if (countDown == -1) {
												manageDisplayedLetters()
												isFinishedCountdown = true
												timer.invalidate()
											} else {
												if (countDown == 2) {
													SoundManager.shared.playSound(SoundAssets.dua)
												} else if (countDown == 1) {
													SoundManager.shared.playSound(SoundAssets.satu)
												} else {
													SoundManager.shared.playSound(SoundAssets.mulai)
												}
											}
										}
								}
						} else if (isFinishedCountdown && !isFinishedPlaying) {
							HStack {
								ForEach(displayedLetter, id: \.self) { dpLetter in
									ZStack {
										Text(dpLetter.letter.letterName)
                                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 150))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
									}
									.transition(.asymmetric(insertion: .scale, removal: .opacity))
									.padding(.trailing, 100)
									.onTapGesture {
										SoundManager.shared.playSound(SoundAssets(rawValue: dpLetter.letter.letterName) ?? .a)
										if (dpLetter.letter.letterName == letters[lastDisplayedLetter].letterName) {
											letters[dpLetter.id].isFinded = true
											displayedLetter.remove(at: 0)
											numberOfDisplayedLetter = displayedLetter.count

											if (dpLetter.letter.letterName == "a") {
												finishGame()
											} else {
												lastDisplayedLetter += 1
											}
										} else {
											SoundManager.shared.playSound(SoundAssets.wrongSoundEffect, channel: 1)
											HapticManager.shared.impact(style: .medium)
										}
									}
								}
							}.onAppear {
								Timer
									.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
										manageDisplayedLetters()
									}
							}
						}
					}
					.frame(width: geo.size.width, height: geo.size.height * 0.9, alignment: .center)

					ZStack {
                        BottomBoardLetter(
                            letters: letters,
                            isFinished: isFinishedPlaying ? true : false,
                            endingDuration: 2.0
                        )
					}.frame(width: geo.size.width * 0.95, height: geo.size.height * 0.1, alignment: .center)
						.background(Color.white.opacity(0.83))
				}
                if (nextScreenId != nil ) {
                    HStack {}
                    .overlay(
                        NavigationLink(destination: mainStoryLane[nextScreenId!].body,
                                       isActive: $nextSceneActive) { EmptyView() }
                    )
                }
			}
        }
        .onAppear {
            SoundManager.shared.playSound(.mini1Bgm, channel: 2, loop: -1)
        }
	}

	func manageDisplayedLetters() {
		if (numberOfDisplayedLetter <= 1) {
            // swiftlint:disable:next identifier_name
			var i = 0
			for letter in letters {
				if (!letter.isFinded && !letter.isDisplayed) {
					displayedLetter.append( DisplayedLetters(id: i, letter: letter))
					letters[i].isDisplayed = true
					numberOfDisplayedLetter += 1

					SoundManager.shared.playSound(SoundAssets.miniGame1Bubble, channel: 1)
					break
				}
				i += 1
			}
		}
	}
}

struct MiniGameOneView_Previews: PreviewProvider {
	static var previews: some View {
		MiniGameOneView()
			.previewInterfaceOrientation(.landscapeRight)
	}
}
