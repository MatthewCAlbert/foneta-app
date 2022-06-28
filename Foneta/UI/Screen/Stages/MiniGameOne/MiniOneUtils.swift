//
//  MiniOneUtils.swift
//  Foneta
//
//  Created by Rahmat Afriyanton on 26/06/22.
//

import Foundation
import SwiftUI

// Background Image
struct FullBackgroundImage: View {
	var image: String
	var body: some View {
		GeometryReader { geo in
			Image(image)
				.resizable()
				.scaledToFill()
				.aspectRatio(contentMode: .fill)
				.frame(
					width: geo.size.width,
					height: geo.size.height,
					alignment: .center)
		}
	}
}

struct Letter: Hashable {
	var letterName: String
	var isFinded = false
	var isDisplayed = false
}

struct DisplayedLetters: Hashable {
	var id: Int
	var letter: Letter
}

struct BottomBoardLetter: View {
	var letters: [Letter]
	var isFinished = true
	@State var kepiX: CGFloat = 0.0
	@State var kepiY: CGFloat = 0.0
	@State var kepiHeight: CGFloat = 50
	@State var kepiWidth: CGFloat = 50
	var body: some View {
		HStack {
			ForEach(letters, id: \.self) {letter in
				Text(letter.letterName)
					.miniOneBottomBoardBold(fontColor: letter.isFinded ? .black : .gray)
			}

			if (isFinished) {
				ZStack {
					Image("Kepi-Happy")
						.resizable()
						.scaledToFit()
						.frame(
							width: kepiHeight,
							height: kepiWidth,
							alignment: .trailing)
						.offset(x: kepiX, y: kepiY)
				}.onAppear {
					Timer
						.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
							withAnimation {

								if (kepiY > -350) {
									kepiX -= 70
									kepiY -= 70

									SoundManager.shared.playSound(SoundAssets.miniGame1Bubble)
								} else {
									kepiWidth = 300 * 0.9
									kepiHeight = 300 * 0.9
								}
							}
						}
				}
			}
		}
	}
}

extension Text {
	func miniOneBottomBoardBold(fontColor: Color) -> some View {
		self.font(
			Font.custom(AppFont.openDyslexic.rawValue,
						size: 20))
		.foregroundColor(fontColor)
		.fontWeight(.bold)
		.padding(.trailing, 5)
	}

	func miniOneGamePlayFont() -> some View {
		self.font(Font
			.custom(AppFont.openDyslexic.rawValue,
					size: 100))
		.fontWeight(.bold)
		.foregroundColor(.white)
	}

}
