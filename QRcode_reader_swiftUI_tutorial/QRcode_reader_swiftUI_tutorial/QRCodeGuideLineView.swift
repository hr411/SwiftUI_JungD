//
//  QRCodeGuideLineView.swift
//  QRcode_reader_swiftUI_tutorial
//
//  Created by hyorin song on 2021/11/10.
//

import SwiftUI

struct QRCodeGuideLineView : View{
    
    let centerPosition : (GeometryProxy) -> CGPoint = {proxy in
         return CGPoint(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
    } //가운데정렬
    
    var body: some View{
        
        
        GeometryReader{ geometryproxy in
            RoundedRectangle(cornerRadius: 20).stroke(style: StrokeStyle(lineWidth: 10, dash:[11]))
                .frame(width: geometryproxy.size.width/2, height: geometryproxy.size.height/4)
                .foregroundColor(Color.yellow)
                .position(centerPosition(geometryproxy)) //가운데정렬
        }
    }
}

struct QRCodeGuideLineView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}
