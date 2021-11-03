//
//  MyCircleImageView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/03.
//

import SwiftUI

struct MyCircleImageView : View{
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
        .resizable()
//        .scaledToFill()
        .scaledToFit() //aspectRatio
        .frame(width: 200, height: 180)
        .clipShape(Circle())
        .shadow(color: .gray, radius: 10, x: 0, y: 0)
        .overlay(
            Circle().strokeBorder(Color.purple,lineWidth: 15))
    }
}

struct MyCircleImageView_Priviews: PreviewProvider {
    static var previews: some View {
        MyCircleImageView( imageString: "song")
    }
}
