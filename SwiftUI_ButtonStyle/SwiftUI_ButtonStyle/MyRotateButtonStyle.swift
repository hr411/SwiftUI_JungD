//
//  MyRotateButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/14.
//


import SwiftUI


struct MyRotateButtonStyle: ButtonStyle{
    
    var color : Color
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(90): .degrees(0))
//            .rotationEffect(configuration.isPressed ? .degrees(90): .degrees(0),anchor: .bottomTrailing)

    }
}

struct MyRotateButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Click")
        }, label: {
            Text("호호")
        }).buttonStyle(MyRotateButtonStyle(color: Color.blue))
    }
}
