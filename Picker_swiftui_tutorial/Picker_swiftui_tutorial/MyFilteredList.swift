//
//  MyFilteredList.swift
//  Picker_swiftui_tutorial
//
//  Created by hyorin song on 2021/11/17.
//

import SwiftUI

enum School : String, CaseIterable{
    case elementaty = "딩초"
    case middle = "중딩"
    case high = "고딩"
}

func prepareDate() -> [MyFriend]{
    var newList = [MyFriend]()

    for i in 0...20{
        let newFriend = MyFriend(name: "내 친구 \(i)", school: School.allCases.randomElement()!)
        newList.append(newFriend)
    }
    return newList
}

struct MyFriend : Identifiable, Hashable{
    var id = UUID()
    var name : String
    var school : School
}

struct MyFilteredList: View{
    
    @State private var filteredValue = School.elementaty
    
    @State private var myFriendsList = [MyFriend]()
    
    //생성자 메소드
    init(){
        _myFriendsList = State(initialValue: prepareDate())
    }
    
    var body: some View{
        VStack{
            Text("선택된 필터 : \(filteredValue.rawValue)")
            Picker(selection: $filteredValue, label: Text(""), content: {
                Text("딩초").tag(School.elementaty)
                Text("중딩").tag(School.middle)
                Text("고딩").tag(School.high)
            }).pickerStyle(SegmentedPickerStyle())
            
            List{
                ForEach(myFriendsList.filter{ filterTerm in
//                    $0.school == filteredValue
                    filterTerm.school == filteredValue
                }){
                    friendItem in
                    GeometryReader{ geomtryProxy in
                        HStack{
                            Text("name : \(friendItem.name)")
                                .frame(width: geomtryProxy.size.width/2)
                            Divider()
                            Text("School : \(friendItem.school.rawValue)")
                                .frame(width: geomtryProxy.size.width/2)
                        }
                    }
                }
            }
            
        }
        
    }
}


struct MyFilteredList_Previews: PreviewProvider {
    static var previews: some View {
        MyFilteredList()
    }
}
