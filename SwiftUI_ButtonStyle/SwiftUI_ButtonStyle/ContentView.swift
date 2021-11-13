//
//  ContentView.swift
//  SwiftUI_ButtonStyle
//
//  Created by hyorin song on 2021/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Button(
                action:{
                    print("button clicked")
                },label: {
                    Text("탭")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
