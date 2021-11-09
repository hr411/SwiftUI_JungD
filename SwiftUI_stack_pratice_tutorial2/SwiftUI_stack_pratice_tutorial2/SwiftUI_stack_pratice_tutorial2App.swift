//
//  SwiftUI_stack_pratice_tutorial2App.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/27.
//

import SwiftUI

@main
struct SwiftUI_stack_pratice_tutorial2App: App {
    var body: some Scene {
        WindowGroup {
            MyCustomTabView(tabIndex: .home)
        }
    }
}
