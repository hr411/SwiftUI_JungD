//
//  ContentView.swift
//  SwiftUI_Webview2
//
//  Created by hyorin song on 2021/12/20.
//


import SwiftUI

struct ContentView: View {

    @EnvironmentObject var myWebVM : WebViewModel
    
    @State var textString = "더미텍스트"
    @State var shouldShowAlert = false
    
    var body: some View {
//        MyWebview(urlToLoad: "https://www.naver.com")
        
        NavigationView{
            
            ZStack{
                VStack{
                    MyWebview(urlToLoad: "https://hr411.github.io/simple_js_alert/")
                    webViewBottomTabbar
                }
                .navigationBarTitle(Text("쏭쏭이 웹뷰"), displayMode: .inline)
                .navigationBarItems(
                    leading: siteMenu,
                    trailing: Button("iOS -> Js"){
                        print("iOS -> Js 버튼 클릭")
                        self.shouldShowAlert.toggle()
                })
                if self.shouldShowAlert{createTextAlert()}
//                Text(textString)
//                    .font(.system(size:26))
//                    .fontWeight(.bold)
//                    .background(Color.yellow)
//                    .offset(y: -(UIScreen.main.bounds.height * 0.3))
            }//Zstack
        }//NavigationView
    }
    //사이트 메뉴
    var siteMenu: some View{
        Text("사이트 이동")
            .foregroundColor(.blue)
            .contextMenu(ContextMenu(menuItems: {
                Button(action: {
                    print("쏭쏭이 웹뷰 이동")
                    self.myWebVM.changedUrlSubject.send(.DEV_SONG)
                }, label: {
                    Text("쏭쏭이 웹뷰 이동 ♔")
                })
                Button(action: {
                    print("네이버 이동")
                    self.myWebVM.changedUrlSubject.send(.NAVER)
                }, label: {
                    Text("네이버 이동 ♖")
                })
                Button(action: {
                    print("구글 이동")
                    self.myWebVM.changedUrlSubject.send(.GOOGLE)
                }, label: {
                    Text("구글 이동 ♘")
                })
            }))
    }
    //웹뷰 bottom tabbar
    var webViewBottomTabbar : some View{
        VStack{
            Divider()
            HStack{
                Spacer()
                Button(action: {
                    print("뒤로가기")
                }, label: {
                    Image(systemName: "arrow.backward")
                        .font(.system(size: 20))
                })
                Group{
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    print("앞으로가기")
                }, label: {
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 20))
                })
                Group{
                    Spacer()
                    Divider()
                    Spacer()
                }
                Button(action: {
                    print("새로고침")
                }, label: {
                    Image(systemName: "arrow.clockwise")
                        .font(.system(size: 20))
                })
                Spacer()
            }.frame(height:50)
            Divider()
        }
    }
}

extension ContentView{
    func createTextAlert() -> MyTextAlertView {
        MyTextAlertView(textString: $textString, showAlert: $shouldShowAlert, title: "iOS->Js 보내기", message: "")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
