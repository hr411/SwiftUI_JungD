//
//  MyProfileView.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/11/01.
//

import SwiftUI

struct MyProfileView : View{
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)){
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View{
            ScrollView{
                VStack {
                    MyCircleImageView(imageString: "song")
                        .padding(.vertical, 20)
                    Text("원샷요구르트")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    
                    Spacer().frame(height: 30)
                    HStack{
                        Text("구독")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                        
                        Text("좋아요")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                    }
    //                .padding()
                    Spacer()
                }
            }//ScrollView
            .navigationBarTitle("내 프로필")
            .font(.system(size: 20))
            .navigationBarItems(trailing: NavigationLink(destination: Text("설정화면입니다.").font(.largeTitle).fontWeight(.bold)){
                Image(systemName: "gear")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
            }
            )
            .onAppear{self.isNavigationBarHidden = false}
            

    }//View
}


struct MyProfileView_Priviews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
