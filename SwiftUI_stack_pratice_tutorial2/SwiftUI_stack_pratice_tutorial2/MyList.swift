//
//  MyList.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/28.
//

import SwiftUI

struct MyList: View{
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        if #available(iOS 14.0, *){
            
        }else{
            UITableView.appearance().tableFooterView = UIView()
        }
        UITableView.appearance().separatorStyle = .none
        
        _isNavigationBarHidden = isNavigationBarHidden
    }
    var body: some View{
//        Text("마이리스트")
        
//        List{
//            ForEach(1...10, id: \.self){
//                Text("마이리스트 \($0)")
//            }
//        }
        List{
            
            Section(header: Text("오늘 할 일")
                        .font(.headline).foregroundColor(Color.black)
                    , footer: Text("footer")){
                ForEach(1...3, id: \.self){itemIndex in
    //                Text("마이리스트 \(itemIndex)")
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.green)
                }
            }
            .listRowInsets(EdgeInsets.init(top:5, leading: 5, bottom: 5, trailing: 5))
            
            Section(header: Text("내일 할 일")
                        .font(.headline).foregroundColor(Color.black)){
                ForEach(1...20, id: \.self){itemIndex in
    //                Text("마이리스트 \(itemIndex)")
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue)
                }
            }
            .listRowInsets(EdgeInsets.init(top:5, leading: 5, bottom: 5, trailing: 5))
            .listRowBackground(Color.yellow)
            .navigationTitle("쏭쏭의 리스트")
        }
        .listStyle(GroupedListStyle())
//        .listStyle(PlainListStyle())
        .navigationBarTitle("메인")
//        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear{
            self.isNavigationBarHidden = false
        }
        
    }
}

struct MyList_Preview: PreviewProvider{
    static var previews: some View {
        MyList()
    }
}
