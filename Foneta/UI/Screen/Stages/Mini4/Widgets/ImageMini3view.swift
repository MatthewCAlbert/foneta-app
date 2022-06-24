import Foundation
import SwiftUI

struct ImageMini4View:View{
    
    var imageContent:ImageContent
    var onClick:(() -> Void)
//    var imageName:String
    var body: some View{
    Button(action:{
        onClick()
    }){
        VStack{
        RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(width: 150, height: 150)
                .padding(.all,10)
                .overlay(VStack{
                    Image(imageContent.name!)
                        .resizable()
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                        .padding()
                        .background(.red)
                        .frame(width: 100.0, height: 100.0)
                        .cornerRadius(50)
                        .overlay(Circle().stroke(Color.black,lineWidth: 5))
                    Text(imageContent.name!)
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                })
        }
        }
    }
}

