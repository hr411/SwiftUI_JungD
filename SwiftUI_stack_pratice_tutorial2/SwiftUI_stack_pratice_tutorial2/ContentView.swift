//
//  ContentView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden : Bool = false
    
    var body: some View {
    
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                
                VStack(alignment: .leading, spacing: 0){
                    
                    HStack{
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)){
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: MyProfileView(isNavigationBarHidden: self.$isNavigationBarHidden)){
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                        
                    }.padding(20)
                    
                    Text("쏭쏭 할 일목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)
                        .padding(.horizontal,20)
                    
                    ScrollView{
                        VStack{
                            MyProjectCard()
                            MyBasicCard()
                            MyCard(icon: "tray.fill", title: "청소", start: "10 AM", end: "11 AM", bgColor: Color.blue)
                            MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                            MyCard(icon: "tv.fill", title: "TV시청", start: "8 PM", end: "10 PM", bgColor: Color.red)
                            
                            
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
            .navigationBarTitle("뒤로가기")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear{
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
