//
//  MyViewModel.swift
//  State_Binding_Environment_tutorial
//
//  Created by hyorin song on 2021/12/08.
//

import Foundation
import Combine

class MyViewModel: ObservableObject {
    
    @Published var appTitle: String = "요구르트의 일상"
}
