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
//            RoundedRectangle(cornerRadius: 25)
//                    .fill(.white)
//                    .frame(width: 150, height: 150)
//                    .padding(.all,10)
//                    .overlay(VStack {
                ZStack{
                    Image(imageContent.name!)
                            .resizable()
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                            .padding()
                            .background(.cyan)
                            .frame(width: 120, height: 120)
                            .cornerRadius(50)
                            .overlay(Circle().stroke(Color.white,lineWidth: 5))
                VStack{
                    Spacer()
                        .frame(height:120)
                RoundedRectangle(cornerRadius: 25)
                                    .fill(.white)
                                    .frame(width: 150, height: 50)
                                    .padding(.all,10)
                                    .overlay(
                                        Text(imageContent.name!)
                                            .font(Font.custom(AppFont.openDyslexic.rawValue, size: 30))
                                            .foregroundColor(.black)
                    )}
                }
            }
            }
               )
    }
}
