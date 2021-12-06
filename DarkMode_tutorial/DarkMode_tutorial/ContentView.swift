//
//  ContentView.swift
//  DarkMode_tutorial
//
//  Created by hyorin song on 2021/12/06.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        
        ZStack{
//            Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
            VStack{
                
                Spacer()
                Button(action: {
                    print("버튼이 클릭되었다")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인 하러가기")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Theme.myButtonColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13).stroke(Color.white,lineWidth: 3))
                })
                    .alert(isPresented: $shouldShowAlert, content: {
                        Alert(title: Text("안녕하세요!"), message: Text("오늘도 화이팅!"), dismissButton: .default(Text("닫기")))
                    })
                Spacer().frame(height: 100)
                    
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) ->
    Color{
        let lightColor = Color.white
        let dartColor = Color.blue
        
        switch scheme {
        case.light:
            return lightColor
        case.dark:
            return dartColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonColor(forScheme scheme: ColorScheme) ->
    Color{
        let lightColor = Color.pink
        let dartColor = Color.purple
    
        switch scheme {
        case.light:
            return lightColor
        case.dark:
            return dartColor
        @unknown default:
            return lightColor
        }
    }
}
