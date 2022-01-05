//
//  WebViewModel.swift
//  SwiftUI_Webview2
//
//  Created by hyorin song on 2021/12/27.
//

import Foundation
import Combine

typealias WEB_NAVIGATION = WebViewModel.NAVIGATION

class WebViewModel: ObservableObject {
    
    enum NAVIGATION {
        case BACK, FORWARD, REFRESH
    }
    
    enum URL_TYPE {
        case NAVER
        case GOOGLE
        case DEV_SONG
        var url : URL?{
            switch self {
            case.NAVER:
                return URL(string: "https://www.naver.com")
            case.GOOGLE:
                return URL(string: "https://www.google.com")
            case.DEV_SONG:
                return URL(string: "https://hr411.github.io/simple_js_alert/")
                
            }
        }
    }
    //웹뷰의 url이 변경
    var changedUrlSubject = PassthroughSubject<WebViewModel.URL_TYPE, Never>()
    
    //웹뷰 네비게이션 액션에 대한 이벤트
    var webNavigationSubject = PassthroughSubject<WEB_NAVIGATION, Never>()
    
    //웹사이트 타이틀 이벤트
    var webSiteTitleSubject = PassthroughSubject<String, Never>()
    
    //ios -> js 함수 호출
    var nativeToJsEvent = PassthroughSubject<String, Never>()
}
