import Foundation
import SwiftUI

struct Mini3Card: View {
//    var imageContent: ImageContent
    var text:String!
    var onClick: (() -> Void)

    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            VStack {
            RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: 120, height: 50)
                    .padding(.all,10)
                    .overlay(VStack {
                        Text(text)
                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 20))
                            .foregroundColor(.black)
                    })
            }
        })
    }
}
