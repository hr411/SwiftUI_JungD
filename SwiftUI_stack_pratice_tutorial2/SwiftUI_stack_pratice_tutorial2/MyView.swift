//
//  MyView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/07.
//

import SwiftUI

struct MyView : View{
    var title: String
    
    var bgColor: Color
    
    var body: some View{
        ZStack{
            bgColor.edgesIgnoringSafeArea(.all)
            
            Text(title)
                .fontWeight(.black)
                .font(.largeTitle)
                .foregroundColor(Color.white)
        }.animation(.none)
    }
}

struct MyView_Priviews: PreviewProvider {
    static var previews: some View {
        MyView(title: "1", bgColor: Color.red)
    }
}
