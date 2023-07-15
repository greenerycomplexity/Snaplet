//
//  ThoughtBubbleView.swift
//  Luminar
//  Custom bubble view for comments within the home view
//
//  Created by Hai Son Cao on 13/7/2023.
//

import SwiftUI

struct ThoughtBubbleView: View {
    
    var comment: String
    var mirrored:Bool = false
    
    var circle_offset_x: CGFloat = 12
    var bubble_offset_x: CGFloat = 92
    
    @State var showBubble1 = false
    @State var bubble2Opacity = 0.0
    @State var contentOpacity = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color("creamyCream"))
                .frame(width: 10)
                .opacity(showBubble1 ? 1 : 0)

            Circle()
                .fill(Color("creamyCream"))
                .frame(width: 15)
                .offset(x: mirrored ? -circle_offset_x: circle_offset_x, y: -8)
                .opacity(bubble2Opacity)
            
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
            .opacity(contentOpacity)
            
        }.onAppear {
            withAnimation(.spring().speed(2)) {
                showBubble1 = true
            }
            withAnimation(.easeIn(duration: 1)) {
                bubble2Opacity = 1
            }
            withAnimation(.easeInOut(duration: 1)) {
                contentOpacity = 1
            }
        }
        
    }
}

struct ThoughtBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtBubbleView(comment: "Hello, world!")
    }
}
