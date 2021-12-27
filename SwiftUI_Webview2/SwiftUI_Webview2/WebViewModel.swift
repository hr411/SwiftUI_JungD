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
        case BACK, FROWARD, REFRESH
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
    var changedUrlSubject = PassthroughSubject<WebViewModel.Never>()
}
