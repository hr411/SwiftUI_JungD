//
//  ContentView.swift
//  menu_tutorial
//
//  Created by hyorin song on 2021/11/22.
//

import SwiftUI

let myPets = ["λ©λ©μ΄ πΆ" ,"μ΄ν₯μ΄ π―" ,"μ°μ°μ΄ π­"]

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
                Text("μ°μΈ‘ μλ¨μ '...'λ₯Ό λλ¬μ£ΌμΈμ!")
                    .font(.title2)
                    .fontWeight(.black)
                Spacer()
                Spacer()
                
            }
                .padding()
                .navigationTitle("νμ΄μ")
                .toolbar(content: {
                    ToolbarItem(placement: .primaryAction , content: {
                        Menu(content: {
                            Button(action: {
                                //μ‘μ
                                print("μ΄μ½λ© λ²νΌν΄λ¦­")
                                shouldShowAlert = true
                                myText = "μ€λμ μ΄μ½λ©"
                            }, label: {
                                //λΌλ²¨
                                Label("μ΄μ½λ©",systemImage: "flame.fill")
                            })
                            
                            Section{
                                Button{
                                    print("μ¬λ λ  λ²νΌν΄λ¦­")
                                    shouldShowAlert = true
                                    myText = "μ€λμ μ¬λ λ "
                                } label:{
                                    Label("μ¬λ λ ",systemImage: "house.fill")
                                }
                            }
                            Section{
                                Button{
                                }label: {
                                    Label("μνμΌ λ§λ€κΈ°", systemImage: "doc")
                                }
                                
                                Button{
                                }label: {
                                    Label("νμΌ λͺ¨λ μ­μ ", systemImage: "trash")
                                }
                            }
                            Picker(selection: $selected, label: Text("μ μλλ¬Ό μ ν")){
                                ForEach(myPets.indices, id: \.self,content: {
                                    index in Text("\(myPets[index])").tag(index)
                                })
                            }
                            
                            
                         
                            
                        }, label: {
                            Circle()
                                .foregroundColor(Color.pink)
                                .frame(width: 50, height: 50)
                                .overlay(
                                Label("λλ³΄κΈ°", systemImage: "ellipsis")
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                            )
                        }) //menu
                    })
                }) //Toolbar
                .alert(isPresented: $shouldShowAlert, content:{
                    Alert(title: Text("μλ¦Ό"), message: Text("\(myText)"), dismissButton: .default(Text("νμΈ")))
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
