////
////  CountDownView.swift
////  Foneta
////
////  Created by Rahmat Afriyanton on 22/06/22.
////
//
//import SwiftUI
//
//struct CountDownView: View {
//	var countDownRemaining:Int = 0
//    var body: some View {
//		Text(countDownRemaining > 0 ? "\( countDownRemaining)" : "Mulai")
//			.font(Font.custom(AppFont.openDyslexic.rawValue, size: 100))
//			.fontWeight(.bold)
//			.foregroundColor(.white)
//			.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//    }
//}
//
//struct CountDownView_Previews: PreviewProvider {
//    static var previews: some View {
//		CountDownView()
//			.previewInterfaceOrientation(.landscapeLeft)
//    }
//}
//
//
//struct BottomBoard: View {
//	var letters: [Letter]
//
//	var body: some View {
//		GeometryReader { geo in
//			HStack {
//				ZStack {
//					LetterBox(
//						width: geo.size.width * 0.9, height: max(geo.size.height * 0.1, 100)
//					)
//					.multilineTextAlignment(.center)
//
//					HStack {
//						ForEach(letters, id: \.self) {letter in
//							CaptionLetter(letter: letter)
//						}
//					}
//				}
//			}
//			.frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
//		}
//	}
//}
//
//struct LetterBox: View {
//	let width: CGFloat
//	let height: CGFloat
//
//	var body: some View {
//		VStack(alignment: .center) {
//			Text("")
//		}
//		.frame(width: width, height: height, alignment: .center)
//		.padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
//		.cornerRadius(20)
//		.background(Color.white.opacity(0.83))
//	}
//}
//
//struct CaptionLetter: View {
//	var letter:Letter
//	var body: some View {
//		Text(letter.letterName)
//			.font(Font.custom(AppFont.openDyslexic.rawValue, size: 20))
//			.foregroundColor(letter.isFinded ? .red : .gray)
//			.fontWeight(.bold)
//			.padding(.trailing, 5)
//	}
//}
//
//struct Letter:Hashable {
//	var letterName: String
//	var isFinded = false
//	var isDisplayed = false
//}
