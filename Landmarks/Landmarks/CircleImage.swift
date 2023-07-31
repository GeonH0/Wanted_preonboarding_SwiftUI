//
//  CircleImage.swift
//  Landmarks
//
//  Created by 김건호 on 2023/07/24.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            
            
            .clipShape( Path { path in
                path.move(to:CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 200))
                path.addLine(to: CGPoint(x: 200, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 0))
            })
            .overlay{
//                Circle().stroke(.white,lineWidth: 4)
                Ellipse().stroke(.white,lineWidth: 4).frame(width: 100,height: 50)
            }
            .shadow(radius: 7)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
