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
    @State var nonConsequential = 0.0
    
    var circle_offset_x: CGFloat = 12
    var bubble_offset_x: CGFloat = 92
    
    @State var bubble1Opacity = 0.0
    @State var bubble2Opacity = 0.0
    @State var contentOpacity = 0.0
    
    var bubble1Delay:Double = 0.5
    var bubble2Delay:Double = 1.5
    var contentDelay:Double = 3
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color("creamyCream"))
                .frame(width: 10)
                .opacity(bubble1Opacity)

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
            withAnimation(nil){
                nonConsequential = 1
                
                withAnimation(.easeIn(duration: 1).delay(bubble1Delay)) {
                    bubble1Opacity = 1
                }
                withAnimation(.easeIn(duration: 1).delay(bubble2Delay)) {
                    bubble2Opacity = 1
                }
                withAnimation(.easeIn(duration: 1).delay(contentDelay)) {
                    contentOpacity = 1
                }
            }

        }
        
    }
}

struct ThoughtBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ThoughtBubbleView(comment: "Hello, world!")
    }
}
