//
//  ContentView.swift
//  menu_tutorial
//
//  Created by hyorin song on 2021/11/22.
//

import SwiftUI

let myPets = ["멍멍이 🐶" ,"어흥이 🐯" ,"찍찍이 🐭"]

struct ContentView: View{
    @State private var shouldShowAlert : Bool = false
    @State private var myText : String = ""
    @State private var selected: Int = 0
    
    var body: some View {
        
        NavigationView{
            VStack{
                Spacer()
                Text("\(myPets[selected])")
                    .font(.system(size: 60))
                    .bold()
                Text("우측 상단에 '...'를 눌러주세요!")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
                Spacer()
                
            }
                .padding()
                .navigationTitle("하이요")
                .toolbar(content: {
                    ToolbarItem(placement: .primaryAction , content: {
                        Menu(content: {
                            Button(action: {
                                //액션
                                print("열코딩 버튼클릭")
                                shouldShowAlert = true
                                myText = "오늘은 열코딩"
                            }, label: {
                                //라벨
                                Label("열코딩",systemImage: "flame.fill")
                            })
                            
                            Section{
                                Button{
                                    print("쉬는 날 버튼클릭")
                                    shouldShowAlert = true
                                    myText = "오늘은 쉬는 날"
                                } label:{
                                    Label("쉬는 날",systemImage: "house.fill")
                                }
                            }
                            Section{
                                Button{
                                }label: {
                                    Label("새파일 만들기", systemImage: "doc")
                                }
                                
                                Button{
                                }label: {
                                    Label("파일 모두 삭제", systemImage: "trash")
                                }
                            }
                            Picker(selection: $selected, label: Text("애완동물 선택")){
                                ForEach(myPets.indices, id: \.self,content: {
                                    index in Text("\(myPets[index])").tag(index)
                                })
                            }
                            
                            
                         
                            
                        }, label: {
                            Circle()
                                .foregroundColor(Color.pink)
                                .frame(width: 50, height: 50)
                                .overlay(
                                Label("더보기", systemImage: "ellipsis")
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                            )
                        }) //menu
                    })
                }) //Toolbar
                .alert(isPresented: $shouldShowAlert, content:{
                    Alert(title: Text("알림"), message: Text("\(myText)"), dismissButton: .default(Text("확인")))
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
