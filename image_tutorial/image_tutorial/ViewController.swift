//
//  ViewController.swift
//  image_tutorial
//
//  Created by hyorin song on 2021/10/23.
//

import SwiftUI

struct ViewController: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("myImage")
                    .frame(height: 10)
                    .offset(y: -1300)
                
                CircleImageViews()
                
                HStack {
                    NavigationLink(destination: MyWebView(urlToLoad:"https://www.youtube.com/channel/UCN9JwOHB34MXSjSHcbTuFDA/featured")){
                        Text("구독하러 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                }
                .padding(50)
            }
        }
    }
}

struct ViewController_Priviews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}
