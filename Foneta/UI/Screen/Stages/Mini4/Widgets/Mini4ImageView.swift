import Foundation
import SwiftUI

struct Mini4ImageView: View {
    var imageContent: ImageContent
    var onClick: (() -> Void)

    var body: some View {
        Button(action: {
            onClick()
        }, label: {
            VStack(spacing:0) {
                ZStack {
                    Image(imageContent.name!)
                            .resizable()
                            .imageScale(.large)
                            .padding()
                            .background(Color("trueBlue"))
                            .frame(width: 150, height: 150)
                            .cornerRadius(70)
                            .overlay(Circle().stroke(Color.white,lineWidth: 5))
                VStack {
                    Spacer()
                        .frame(height:130)
                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 200, height: 50)
                                    .padding(.all,10)
                                    .overlay(
                                        Text(imageContent.name!)
                                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 45))
                                            .foregroundColor(.black)
                    )}
                }
            }
            }
       )
    }
}
