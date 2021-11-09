//
//  MyTapView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/07.
//

import SwiftUI

struct MyTabView : View{
    var body: some View {
        TabView{
//            Text("1번")
//                .fontWeight(.black)
//                .font(.largeTitle)
//                .foregroundColor(Color.white)
            MyView(title: "1번", bgColor: Color.red)
                .tabItem{
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
//            Text("2번")
//                .fontWeight(.black)
//                .font(.largeTitle)
//                .foregroundColor(Color.white)
//                .background(Color.orange)
            MyView(title: "2번", bgColor: Color.orange)
                .tabItem{
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            MyView(title: "3번", bgColor: Color.yellow)
                .tabItem{
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}


struct MyTabView_Priviews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
