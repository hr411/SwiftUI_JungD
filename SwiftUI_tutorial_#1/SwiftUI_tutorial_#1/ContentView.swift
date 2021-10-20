//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by hyorin song on 2021/10/11.
//

import SwiftUI

struct ContentView: View {
    
    
    //@State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    //몸체
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                }
                .padding(isActivated ? 50.0 : 10.0)
                    //왼쪽:leading, 오른쪽:trailing
                    .background(isActivated ? Color.yellow : Color.black)
                    //탭 재스처 추가
                    .onTapGesture {
                        print("HStack이 클릭되었다")
                        
                        withAnimation {
                        //toggle() true이면 false로 false이면 true
                            self.isActivated.toggle()
                        }
                }//HStack
            
                //네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView(isActivated: $isActivated)){
                    Text("네비게이션")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                } .padding(.top, 50)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
