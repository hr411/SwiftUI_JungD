//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/13.
//

import Foundation
import SwiftUI
struct MyButtonStyle: ButtonStyle {
    
    //
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
           .padding()
            .background(Color.init(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
           .foregroundColor(Color.white)
           .cornerRadius(20)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            
        }, label: {
            Text("하하하")
                .fontWeight(.heavy)
        }).buttonStyle(MyButtonStyle())
    }
}
