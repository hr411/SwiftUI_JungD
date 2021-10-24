//
//  MyVstack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by hyorin song on 2021/10/24.
//

import SwiftUI

struct MyVstack : View {
 
    var body: some View{
        VStack(alignment: .trailing, spacing: 0) {

            Spacer()

//           Divider()
//                .opacity(0)
//           Rectangle()
//               .frame(height: 1)
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
//                .padding(.bottom, 100)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
//               .padding(.vertical, 100)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
            
//            Spacer()
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
            
//            Spacer()
        }
        .frame(width: 300)
        //.edgesIgnoringSafeArea(.all) //화면꽉채우기
        .background(Color.green)
    }
}

struct MyVstack_Priviews: PreviewProvider {
    static var previews: some View {
        MyVstack()
    }
}

