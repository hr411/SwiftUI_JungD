//
//  DiceView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by hyorin song on 2021/11/29.
//

import Foundation
import SwiftUI

struct DiceView: View{
    var body: some View{
        VStack{
            Text("⚅")
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color.yellow)
            Button(action: {
                
            }, label: {
                Text("랜덤주사위 굴리기")
                    .fontWeight(.black)
            })
        }
    }
}


struct DiceView_Priviews: PreviewProvider{
    static var previews: some View{
        DiceView()
    }
}
