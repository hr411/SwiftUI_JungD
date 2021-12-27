//
//  SwiftUI_Webview2App.swift
//  SwiftUI_Webview2
//
//  Created by hyorin song on 2021/12/20.
//

import SwiftUI

@main
struct SwiftUI_Webview2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(WebViewModel())
        }
    }
}
