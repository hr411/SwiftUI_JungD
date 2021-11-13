//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/13.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Click")
        }, label: {
            Text("호호")
        }).buttonStyle(MyButtonStyle())
    }
}
