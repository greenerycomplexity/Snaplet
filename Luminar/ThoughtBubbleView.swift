//
//  ThoughtBubbleView.swift
//  Luminar
//
//  Created by Hai Son Cao on 13/7/2023.
//

import SwiftUI

struct ThoughtBubbleView: View {
    
    var comment: String
    var mirrored:Bool = false
    
    var circle_offset_x:CGFloat = 12
    var bubble_offset_x:CGFloat = 92
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color("creamyCream"))
                .frame(width: 10)
                
            
            Circle()
                .fill(Color("creamyCream"))
                .frame(width: 15)
                .offset(x: mirrored ? -circle_offset_x: circle_offset_x, y: -8)
            
            VStack{
                Text(comment)
                    .foregroundColor(Color("navyBlue"))
                    .fontWeight(.bold)
                
                    .multilineTextAlignment( /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal,10)
                    .padding([.top,.bottom], 5)
                
                    .background(Color("creamyCream"))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    //
            }
            .frame(maxWidth: 140, minHeight: 100, alignment: mirrored ? .topTrailing : .topLeading)
            .offset(x: mirrored ? -bubble_offset_x: bubble_offset_x, y: 10)
            
            
            
   
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
        ThoughtBubbleView(comment: "Hello, world!")
    }
}
