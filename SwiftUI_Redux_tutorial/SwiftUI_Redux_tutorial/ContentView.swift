//
//  ContentView.swift
//  SwiftUI_Redux_tutorial
//
//  Created by hyorin song on 2021/11/29.
//

import SwiftUI

struct ContentView: View {
    
    // 스토어 생성
        let store = AppStore(state: AppState.init(currentDice: "⚀"), reducer: appReducer(_:_:))
    
    var body: some View {
        DiceView().environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
