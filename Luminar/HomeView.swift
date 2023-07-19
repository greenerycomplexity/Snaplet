//
//  HomeView.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct HomeView: View {
    
    //    Store whether it is the first time the user opens the app
    //    and present the popover accordingly
    @AppStorage("isFirstTime") var isFirstTime: Bool = true
    @State private var isPopoverShown:Bool = false
    @State var showContactsView = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                // Background gradient for home view
                LinearGradient(gradient: Gradient(colors: AppCustomisation.PinkBlueGradients), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack {
                    
                    // First image
                    ZStack{
                        FloatingImageView(imageName: "toddler_mess_img", offset_x: 75, offset_y: 20)
                            .frame(width: 250, height: 200)
                            .scaleEffect(1.05)


                        ThoughtBubbleView(comment: "What a mess! 🤣🤣", mirrored: true)
                            .offset(x: -20)
                    }
                    
                    Spacer()
                    
                    // Shown weekly prompt, with camera icon in the back
                    ZStack{
                        
                        Image(systemName: "camera")
                            .font(.system(size: 130))
                            .foregroundColor(Color("navyBlue"))
                            .offset(x: -80, y: -40)
                        Image("pointOfView_text")
                            .scaleEffect(1.2)
                            .offset(x: 50, y:40)
                        
                    }

                    
                    Spacer()
                    
                    
                    // Second image
                    ZStack{
                        FloatingImageView(imageName: "mountainGoat_example", offset_x: -95, offset_y: 10)
                            .frame(width: 300, height: 230)

                        ThoughtBubbleView(comment: "How crazy is this ⁉️")
                            .offset(x:-18, y: 20)
                            .scaleEffect(1.2)
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(isActive: $showContactsView) {
                        ContactsView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("")
                    }
                    
                    
                    // Move to camera view
                    NavigationLink{
                        CameraView(onCaptureComplete: {
                            showContactsView = true
                        }, dismissAutomaticallyOnCapture: true)
                        .navigationBarBackButtonHidden(true)
                        .preferredColorScheme(.dark)
                    }
                    
                    // Have image of Start text as label for nav button
                label: {
                    Image("start_button_home")
                        .scaleEffect(0.8)
                        .frame(width: 210, height: 60)
                        .background(Color("ponyPink"))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                }.padding(.top,2.0)
                    
                    
                }
                
            }
            
            .popover(isPresented: $isPopoverShown) {
                
                WelcomeFirst(isPopoverShown: $isPopoverShown)
            }
            
            // If it's the first time user opens app, show popover,
            //            and remember state of var isFirstTime
            .onAppear{
                if isFirstTime {
                    isPopoverShown = true
                    isFirstTime = false
                }
            }
            
        }
        
    }
    
}

struct FloatingImageView : View {
    var imageName: String
    
    @State var offset_x: Double
    @State var offset_y: Double
    @State var imageOpacity: Double = 0.0
    
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(15.0)
            .aspectRatio(contentMode: .fit)
            .glow(color: Color("creamyCream"),radius: 30)
            .offset(x:offset_x, y:offset_y)
//            .opacity(imageOpacity)
            .onAppear{
                withAnimation(nil) {
//                   Giving the withAnimation a non-consequental @State value to change,
//                   so it wouldn't affect all the other views
                    @State var nonConsequential = 0.0
                    nonConsequential = 1.0
                 
                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                        offset_y = offset_y + 4
                    }
                }

            }
        
        
    }
}


extension View {
    func glow(color: Color = .black, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
