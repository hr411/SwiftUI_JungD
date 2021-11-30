//
//  DiceView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by hyorin song on 2021/11/29.
//

import Foundation
import SwiftUI

struct DiceView: View{
    //외부에서 EnvironmentObject로 연결된
    @EnvironmentObject var store: AppStore
    
    @State private var shouldRoll = false
    
    @State private var pressed = false
    
    var diceRollAnimation: Animation{
        Animation.spring()
    }
    //주사위 굴리기 액션을 실행
    func rollTheDice(){
        print(#fileID,#function,#line)
        self.shouldRoll.toggle()
        
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View{
        VStack{
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(Color.yellow)
                .rotationEffect(.degrees(shouldRoll ? 360 : 0))
                .animation(diceRollAnimation)
            Button(action: {
                self.rollTheDice()
            }, label: {
                Text("랜덤주사위 굴리기")
                    .fontWeight(.black)
            }).buttonStyle(MyButtonStyle())
                .scaleEffect(self.pressed ? 0.8 : 1.0)
                .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { pressing in
                    withAnimation(.easeInOut(duration: 0.2),{
                        self.pressed = pressing
                    })
                }, perform: {})
        }
    }
}


struct DiceView_Priviews: PreviewProvider{
    static var previews: some View{
        DiceView()
    }
}
