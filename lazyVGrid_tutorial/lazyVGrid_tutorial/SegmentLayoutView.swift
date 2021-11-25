//
//  SegmentLayoutView.swift
//  lazyVGrid_tutorial
//
//  Created by hyorin song on 2021/11/25.
//

import Foundation
import SwiftUI

enum LayoutType: CaseIterable{
    case table, grid, multiple
}

extension LayoutType {
    //레이아웃 타입에 대한 컬럼이 자동으로 설정되도록 한다
    var column: [GridItem]{
        switch self{
        case .table:
            return [
                //flexible 하나로 한줄로 표현
                GridItem(.flexible())
            ]
        case .grid:
            return [
                //flexible 두개를 넣어서 두개 아이템 들어가게 함
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                //adaptive 크기 닿는데까지 아이템 여러개 넣기
                GridItem(.adaptive(minimum: 100))
            ]
        }
        
    }
}
struct SegmentLayoutView: View{
    
    var dummyDatas = MyModel.dummyDataArray
    
    @State var selectedLayoutType: LayoutType = .table
    
    var body: some View{
        VStack{
            //피커
            Picker(selection: $selectedLayoutType, label: Text("레이아웃 타입"), content: {
                ForEach(LayoutType.allCases, id: \.self, content: {
                    layoutType in
                    switch layoutType{
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                })
            })
                .frame(width: 250)
                .pickerStyle(SegmentedPickerStyle())
            ScrollView{
                LazyVGrid(columns: selectedLayoutType.column, content: {
                    ForEach(dummyDatas){
                        dataItem in
                        switch selectedLayoutType {
                        case .table:
                            MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                        case .grid:
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color.orange)
                                .frame(height: 200)
                                .overlay(
                                    VStack(spacing: 5){
                                        Circle().frame(height: 100)
                                            .foregroundColor(Color.yellow)
                                        Spacer().frame(height: 10)
                                        Text("\(dataItem.title)")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                        Text("\(dataItem.content)")
        
                                    })
                        case .multiple:
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(height:100)
                        }
                        
                    }
                    Rectangle()
                })
                    .animation(.default)
                    .padding(.horizontal, 10)
            }
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
