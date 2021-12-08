//
//  ContentView.swift
//  State_Binding_Environment_tutorial
//
//  Created by hyorin song on 2021/12/08.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    
    @State var count = 0
    
    @State var appTitle : String = ""
    
//    var appTitle : String
    
//    init(appTitle: String = "요구르트의 일상") {
//        self.appTitle  = appTitle
//    }
    
    var body: some View {
        
        TabView{
            VStack{
                Text("오늘도 열코딩: \(count)")
                    .padding()
                Button(action: {
                    count = count + 1
                    viewModel.appTitle = "요구르트의 일상 \(count)일차"
                }, label: {
                        Text("카운트 앱")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10.0)
                    })
            }
                .tabItem{
                    Label("오늘도",systemImage:"pencil.circle")
                }
            
            BeforeBedView(count: $count)
                .padding()
                .tabItem{
                    Label("자기전에",systemImage:"folder.fill")
                }
            
            WeeklyView(count: $count)
                .padding()
                .tabItem{
                    Label("주말에도",systemImage:"paperplane.fill")
                }
        }.overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
            .onReceive(viewModel.$appTitle, perform: { receivedappTitle in
                print("ContentView receivedAppTitle:", receivedappTitle)
                appTitle = receivedappTitle
            })
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
