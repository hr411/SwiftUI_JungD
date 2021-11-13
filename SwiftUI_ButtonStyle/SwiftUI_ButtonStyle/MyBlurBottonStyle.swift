//
//  MyBlurBottonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/14.
//

import SwiftUI


struct MyBlurButtonStyle: ButtonStyle{
    
    var color : Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .blur(radius: configuration.isPressed ? 10 : 0 )

    }
}

struct MyBlurButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Click")
        }, label: {
            Text("호호")
        }).buttonStyle(MyBlurButtonStyle(color: Color.blue))
    }
}


