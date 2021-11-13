//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/13.
//

import SwiftUI

enum ButtonType{
    case tab, long//, smaller, rotate, blur
}

struct MyButtonStyle: ButtonStyle{
    
    var color : Color
    var type : ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .onTapGesture {
                if(self.type == .tab){
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            .onTapGesture {
                if(self.type == .tab){
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }

    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("Click")
        }, label: {
            Text("호호")
        }).buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
    }
}
