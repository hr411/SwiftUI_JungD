//
//  ContentView.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing:30){
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("탭")
                        .fontWeight(.bold)
                }).buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
            
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("롱클릭")
                        .fontWeight(.bold)
                }).buttonStyle(MyButtonStyle(color: Color.red, type: .long))
            
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("회전버튼")
                        .fontWeight(.bold)
                }).buttonStyle(MyRotateButtonStyle(color: Color.yellow))
            
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("축소버튼")
                        .fontWeight(.bold)
                }).buttonStyle(MySmallerButtonStyle(color: Color.green))
            
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("블러버튼")
                        .fontWeight(.bold)
                }).buttonStyle(MyBlurButtonStyle(color: Color.pink))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
