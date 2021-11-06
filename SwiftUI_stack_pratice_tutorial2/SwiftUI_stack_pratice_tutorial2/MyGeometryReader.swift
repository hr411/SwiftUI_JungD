//
//  MyGeometryReader.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/06.
//

import SwiftUI

enum Index{
    case one, two, three
}
struct MyGeometryReader :View{
    
    @State var index : Index = .one
    
    var body: some View{
        
        GeometryReader{ geometryReader in
            VStack(spacing: 0){
                Button(action: {
                    print("1번")
                    withAnimation{
                        self.index = .one
                    }
                    
                }){
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 100, height: geometryReader.size.height/3)
                        .padding(.horizontal, self.index == .one ? 50 : 0)
                        .foregroundColor(Color.white)
                    .background(Color.red)
                
                }
                Button(action: {
                    print("3번")
                    withAnimation{
                        self.index = .two
                    }
                }){
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 100, height: geometryReader.size.height/3)
                        .padding(.horizontal, self.index == .two ? 50 : 0)
                        .foregroundColor(Color.white)
                    .background(Color.blue)
                
                }
                Button(action: {
                    print("3번")
                    withAnimation{
                        self.index = .three
                    }
                }){
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 100, height: geometryReader.size.height/3)
                        .padding(.horizontal, self.index == .three ? 50 : 0)
                        .foregroundColor(Color.white)
                    .background(Color.green)
                
                }
            }
        }.background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyGeometryReader_Priviews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
