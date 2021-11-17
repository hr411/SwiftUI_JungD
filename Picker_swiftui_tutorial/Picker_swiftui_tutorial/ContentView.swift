//
//  ContentView.swift
//  Picker_swiftui_tutorial
//
//  Created by hyorin song on 2021/11/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    
    let myColorArray = ["레드","그린","블루"]
    
    func changeColor(index: Int) -> Color {
        switch index{
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.red
        }
    }
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(self.changeColor(index: selectionValue))
            
            Text("세그먼트 value : \(selectionValue)")
            Text("선택된 값 : \(myColorArray[selectionValue])")
            
            Picker(selection: $selectionValue, label: Text(""), content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
            
            Picker(selection: $selectionValue, label: Text(""), content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            })
                .frame(width: 50, height: 50)
                .clipped()
                .padding()
                .border(self.changeColor(index: selectionValue), width: 2)
            
        }.padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
