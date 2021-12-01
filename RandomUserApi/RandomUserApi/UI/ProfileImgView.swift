//
//  ProfileImgView.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView : View{
    
    var imageUrl: URL
    
    var body: some View{
        
        URLImage(imageUrl, content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
            .frame(width: 50, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.yellow, lineWidth: 2))
    }
}

struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://randomuser.me/api/portraits/men/3.jpg")!
        ProfileImgView(imageUrl: url)
    }
}
