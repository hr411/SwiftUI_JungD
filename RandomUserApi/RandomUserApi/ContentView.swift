//
//  ContentView.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    
    var body: some View {
        List(randomUserViewModel.randomUsers) {
            aRandomUser in RandomUserRowView(aRandomUser)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
