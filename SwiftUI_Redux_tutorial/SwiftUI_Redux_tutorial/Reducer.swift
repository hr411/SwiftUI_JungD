//
//  Reducer.swift
//  SwiftUI_Redux_tutorial
//
//  Created by hyorin song on 2021/11/29.
//

import Foundation

//매개변수로 들어오는 값을 변경하기 위해 inout 키워드를 붙여줌
//(inout State, Action) -> Void 해당 클로져 자체를 별친으로 리듀서로 칭함
//typealias 별칭으로 만든다
typealias Reducer<State, Action> = (inout State, Action) -> Void

//필터링을 하는 메소드
func appReducer(_ state: inout AppState, _ action: AppAction) -> Void{
    //들어오는 액션에 따라 분기 처리 - 즉 필터링
    switch action{
    case .rollTheDice:
        //앱의 상태를 변경하기
        state.currentDice = ["⚀","⚁","⚂","⚃","⚄","⚅"].randomElement() ?? "⚀"
    }
}

