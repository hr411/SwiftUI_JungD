//
//  MyProjectCard.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/27.
//

import SwiftUI

struct MyProjectCard : View {
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            Text("쏭쏭 유툽 스터디")
                .font(.system(size: 20))
                .fontWeight(.black)
                .padding(.bottom, 0)
            Text("10 PM ~ 11 PM")
                .foregroundColor(.secondary)
            Spacer().frame(height: 20)
            HStack {
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.red)
                    )
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                Text("확인")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 80)
                    .background(Color.blue)
                    .cornerRadius(20)
                
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
        
    }
}


struct MyProjectCard_Priviews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
