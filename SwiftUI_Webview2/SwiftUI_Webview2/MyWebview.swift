//
//  MyWebview.swift
//  SwiftUI_Webview2
//
//  Created by hyorin song on 2021/12/20.
//
import SwiftUI
import WebKit
import Combine

// uikit 의 uiview 를 사용할수 있도록 한다.
// UIViewControllerRepresentable
struct MyWebview: UIViewRepresentable {
    
    @EnvironmentObject var viewModel: WebViewModel
   
    var urlToLoad: String
    
    func makeCoordinator() -> MyWebview.Coordinator {
        return MyWebview.Coordinator(self)
    }
    // ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스 생성
        let webview = WKWebView(frame: .zero, configuration: creatWKWebConfig())
        
        //wkwebview 의 델리겟 연결을 위한 코디네이터 설정
        webview.uiDelegate = context.coordinator
        webview.navigationDelegate = context.coordinator
        webview.allowsBackForwardNavigationGestures = true // 가로 스와이프 뒤로가기 설정
        
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
        
    }
    
    // 업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebview>) {
           
       }
    
    func creatWKWebConfig() -> WKWebViewConfiguration {
        let preference = WKPreferences()
        preference.javaScriptCanOpenWindowsAutomatically = true
        preference.javaScriptEnabled = true
        
        let wkWebConfig = WKWebViewConfiguration()
        
        let userContentController = WKUserContentController()
        userContentController.add(self.makeCoordinator(), name: "callbackHandler")
        wkWebConfig.userContentController = userContentController
        wkWebConfig.preferences = preference
        return wkWebConfig
    }
    
    class Coordinator: NSObject {
        var myWebView: MyWebview
        var subscriptions = Set<AnyCancellable>()
        
        init(_ myWebView: MyWebview){
            self.myWebView = myWebView
        }
    }
    
}

//MARK: - UIDelegate 관련
extension MyWebview.Coordinator: WKUIDelegate{
    
}

//MARK: - WKNavigationDelegate 관련
extension MyWebview.Coordinator: WKNavigationDelegate{
    
    //웹뷰 검색 시작
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){
        print("webView didStartProvisionalNavigation")
        myWebView
            .viewModel
            .webNavigationSubject
            .sink{ (action: WEB_NAVIGATION) in
                print("들어온 네비게이션 액션: \(action)")
                switch action{
                case.BACK:
                    if webView.canGoBack{
                        webView.goBack()
                    }
                case.FORWARD:
                    if webView.canGoForward{
                        webView.goForward()
                    }
                case.REFRESH:
                    webView.reload()
                }
            }.store(in: &subscriptions)
    }

    //웹뷰 검색 완료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        print("webView didFinish")
        
        webView.evaluateJavaScript("document.title"){(response, error) in
            if let error = error {
                print("타이틀 에러로 못 가져옴")
            }
            if let title = response as? String {
                self.myWebView.viewModel.webSiteTitleSubject.send(title)
            }
        }
        
        myWebView
            .viewModel
            .nativeToJsEvent
            .sink{ message in
                print("didFinish() called / nativeToJsEvent 이벤트 들어옴 / messge: \(message)")
                webView.evaluateJavaScript("nativeToJsEventCall('\(message)')", completionHandler: {(result, error) in
                    if let result = result {
                        print("nativeToJs result 성공: \(result)")
                    }
                    if let error = error {
                        print("nativeToJs result 실패 : \(error.localizedDescription)")
                    }
                })
            }.store(in: &subscriptions)
        
        myWebView
            .viewModel
            .changedUrlSubject
            .compactMap{ $0.url }
            .sink{ changedUrl in
                print("변경된 url: \(changedUrl)")
                webView.load(URLRequest(url: changedUrl))
            }.store(in: &subscriptions)
    }
}

//MARK: - WKNavigationDelegate 관련
extension MyWebview.Coordinator: WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("WKWebViewCoordinator - uwerContextController / message: \(message)")
    }
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
