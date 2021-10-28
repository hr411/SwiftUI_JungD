//
//  MyBasicCard.swift
//  SwiftUI_stack_pratice_tutorial2
//
//  Created by hyorin song on 2021/10/27.
//

import SwiftUI

struct MyBasicCard: View {
    
    var body: some View {
        
        HStack(spacing: 20){
            Image(systemName: "flame")
                .font(.system(size: 40))
                .foregroundColor(.white)
           
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
                Text("기상")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                
                Spacer().frame(height: 5)
                Text("7 AM - 8 AM")
                    .foregroundColor(.white)
            }
            
        }
        .padding(30)
        .background(Color.purple)
        .cornerRadius(20)
        
    }

}


struct MyBasicCard_Priviews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
