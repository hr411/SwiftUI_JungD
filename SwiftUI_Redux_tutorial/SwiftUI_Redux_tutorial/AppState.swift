//
//  AppState.swift
//  SwiftUI_Redux_tutorial
//
//  Created by hyorin song on 2021/11/29.
//

import Foundation

//앱의 상태 즉 데이터
struct AppState{
    var currentDice: String = ""{
        didSet{
            print("currentDice : \(currentDice)", #fileID, #function)
        }
    }
}

