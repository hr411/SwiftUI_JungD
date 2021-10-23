//
//  CircleImageView.swift
//  image_tutorial
//
//  Created by hyorin song on 2021/10/23.
//

import SwiftUI

struct CircleImageViews : View{
    var body: some View {
//        Image(systemName: "airplane.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 0, y: 10)
        Image("myImage")
        .resizable()
        .scaledToFit() //aspectRatio
        .frame(width: 200, height: 300)
        .clipShape(Circle())
        .shadow(color: .gray, radius: 10, x: 5, y: 10)
        .overlay(
            Circle().foregroundColor(.black)
                .opacity(0.3)
        )
        .overlay(
            Circle().stroke(Color.red,lineWidth: 8)
                .padding(10))
        .overlay(
            Circle().stroke(Color.yellow,lineWidth: 8)
                .padding(20))
        .overlay(
            Circle().stroke(Color.blue,lineWidth: 8))
        .overlay(
            Text("SONG")
                .foregroundColor(.white)
                .font(.system(size: 30))
                .fontWeight(.bold)
        )
//        .aspectRatio(contentMode: .fill)
//        .clipped()
//        .edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageViews_Preview : PreviewProvider {
    static var previews: some View {
        CircleImageViews()
    }
}
