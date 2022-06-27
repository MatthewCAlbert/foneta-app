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

struct Letter:Hashable {
	var letterName: String
	var isFinded = false
	var isDisplayed = false
}

struct DisplayedLetters:Hashable {
	var id: Int
	var letter: Letter
}

struct BottomBoardLetter: View {
	var letters: [Letter]
	var body: some View {
		HStack {
			ForEach(letters, id: \.self) {letter in
				Text(letter.letterName)
					.miniOneBottomBoardBold(fontColor: letter.isFinded ? .black : .gray)
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

	func MiniOneGamePlayFont() -> some View {
		self.font(Font
			.custom(AppFont.openDyslexic.rawValue,
					size: 100))
		.fontWeight(.bold)
		.foregroundColor(.white)
	}

}
