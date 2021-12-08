//
//  TodayView.swift
//  State_Binding_Environment_tutorial
//
//  Created by hyorin song on 2021/12/08.
//

import Foundation
import SwiftUI

struct BeforeBedView: View{
    
    @EnvironmentObject var viewModel: MyViewModel
    
    @Binding var count: Int
    
    @State var title: String = ""
    
    var body: some View{
        VStack{
            Text(title)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding()
            
            Text("자기전에 열코딩: \(count)")
                .padding()
            Button(action: {
                count = count + 1
            }, label: {
                    Text("카운트 앱")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(10.0)
                })
        }.onReceive(viewModel.$appTitle, perform: { receivedAppTitle in
            print("BeforeBadView - receivedAppTitle: ", receivedAppTitle)
            title = receivedAppTitle
        })
    }
}
