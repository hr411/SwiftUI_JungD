//
//  ContentView.swift
//  PreventScreenShotAndRecording_tutorialApp
//
//  Created by hyorin song on 2021/12/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            MainView()
            BlockView()
        }
    }
}


struct AlertData: Identifiable{
    var id: UUID
    var title: String
    var message: String
    
    init(title: String="안녕하세요", message: String="스크린 캡처를 하셨군요"){
        self.id = UUID()
        self.title = title
        self.message = message
    }
}

struct BlockView: View{
    
       // ios 시스템 에서는 시스템 이벤트를 알려준다. - 노티피케이션 센터
       // 노티피케이션 -> publisher 로 받을수 있다.
       // SwiftUi 에서는 publisher 이벤트를 onReceive 로 받는다.
       
       @State private var alertData: AlertData?
       
       // 녹화중 여부
       @State var isRecordingScreen = false
       
       var body: some View {
           ZStack {
               if isRecordingScreen {
                   Color.white
                   Text("화면 녹화중입니다! 🎥")
                       .font(.largeTitle)
                       .padding()
               }
           }
           .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification), perform: { _ in
               print("UIScreen.main.isCaptured : \(UIScreen.main.isCaptured)")
               isRecordingScreen = UIScreen.main.isCaptured
               print(isRecordingScreen ? "녹화 시작" : "녹화 중지")
           })
           .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification), perform: { _ in
               
               print("스크린샷이 찍어졌다.")
               alertData = AlertData()
               
           })
           .edgesIgnoringSafeArea(.all)
           .alert(item: $alertData, content: { alertData in
               Alert(title: Text(alertData.title),
                     message: Text(alertData.message),
                     dismissButton: Alert.Button.cancel(Text("닫기")))
           })
       }
}


struct MainView : View {
    var body: some View {
        VStack{
            Text("안녕하세요\n원샷요구르트입니다! 🐶")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity,
                minHeight: 0, maxHeight: .infinity,
                alignment: .center)
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
