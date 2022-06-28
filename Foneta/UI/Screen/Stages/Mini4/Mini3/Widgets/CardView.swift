import Foundation
import SwiftUI

struct Mini3Card: View {
    @Binding var color:Color
    var text:String!
    var onClick: (() -> Void)

    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            VStack {
            RoundedRectangle(cornerRadius: 25)
                    .fill(color)
                    .frame(width: 180, height: 70)
                    .padding(.all,10)
                    .overlay(VStack {
                        Text(text)
                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 35))
                            .foregroundColor(.black)
                    })
            }
        })
    }
}
