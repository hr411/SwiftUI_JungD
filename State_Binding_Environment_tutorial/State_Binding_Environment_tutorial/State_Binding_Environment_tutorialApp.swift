//
//  State_Binding_Environment_tutorialApp.swift
//  State_Binding_Environment_tutorial
//
//  Created by hyorin song on 2021/12/08.
//

import SwiftUI

@main
struct State_Binding_Environment_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MyViewModel())
        }
    }
}
