//
//  MyHstack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by hyorin song on 2021/10/24.
//

import SwiftUI

struct MyHstack : View {
 
    var body: some View{
    
        HStack(alignment: .bottom) {
            
//            Divider()
            
//            Rectangle()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.red)
            
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 70))
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.green)
    }
    
}

struct MyHstack_Priviews: PreviewProvider {
    static var previews: some View {
        MyHstack()
    }
}

