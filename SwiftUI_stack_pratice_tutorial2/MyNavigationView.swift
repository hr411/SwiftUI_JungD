//
//  MyNavigationView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/01.
//

import SwiftUI

struct MyNavigationView : View{
    var body: some View{
        
        NavigationView{
//            Text("MyNavigationView")
            MyList()
//            .navigationTitle("안녕하세요!")
            .navigationTitle("안녕하세요!")
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action:{
                print("호호")
            }){
                    Text("호호")
            }, trailing: NavigationLink(destination: Text("넘어온 화면입니다.")){
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 25))
                    .foregroundColor(Color.black)
            }
        )
        }
    }
}


struct MyNavigationView_Priviews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
