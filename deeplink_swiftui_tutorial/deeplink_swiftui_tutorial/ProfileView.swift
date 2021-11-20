//
//  ProfileView.swift
//  deeplink_swiftui_tutorial
//
//  Created by hyorin song on 2021/11/20.
//

import Foundation
import SwiftUI

struct ProfileView : View{
    var body: some View{
        Rectangle().foregroundColor(Color.purple)
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .overlay(Text("프로필")
                        .font(.system(size: 23))
                        .fontWeight(.black)
                        .foregroundColor(.blue))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
