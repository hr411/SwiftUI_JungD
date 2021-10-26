//
//  ContentView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            
            VStack(alignment: .leading, spacing: 0){
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }.padding(20)
                
                Text("쏭쏭 할 일목록")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .padding(.horizontal,20)
                
                ScrollView{
                    VStack{
                        MyProjectCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        MyBasicCard()
                        
                    }.padding()
                }
            }
   
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing, 10)
                    .shadow(radius: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
