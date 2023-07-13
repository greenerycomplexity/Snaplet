//
//  ThoughtBubbleView.swift
//  Luminar
//
//  Created by Hai Son Cao on 13/7/2023.
//

import SwiftUI

struct ThoughtBubbleView: View {
    
    var comment: String
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color(.white))
                .frame(width: 10)
            
            Circle()
                .fill(Color(.white))
                .frame(width: 15)
                .offset(x: 12, y: -8)
            
            Text(comment)
                .padding(.horizontal,10)
                .padding([.top,.bottom], 5)
                
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .offset(x: 50, y: -22)
            
   
        }
    }
}

//struct AccentButton: ButtonStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color("ponyPink"))
//            .foregroundStyle(.white)
//            .clipShape(Capsule())
//    }
//}

struct ThoughtBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtBubbleView(comment: "Hello")
    }
}
