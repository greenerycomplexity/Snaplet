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
    
    @State var floating1 = 15.0
    
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
                        FloatingImageView(imageName: "toddler_mess_img", offset_x: 80, offset_y: 20)
                        .frame(width: 250, height: 200)
                    
                        
                        ThoughtBubbleView(comment: "What a mess! 🤣🤣", mirrored: true)
                            .offset(x: -20)
                    }
                    Spacer()
                    
                    // Shown weekly prompt, with camera icon in the back
                    ZStack{
                        
                        Image(systemName: "camera")
                            .font(.system(size: 130))
                            .foregroundColor(Color("navyBlue"))
                            .offset(x: -60, y: -20)
                        Image("morningMood_text")
                            .scaleEffect(1)
                            .offset(x: 50, y:50)
                        
                    }.animation(nil)
                    
                    Spacer()
                    
                    
                    // Second image
                    ZStack{
                        FloatingImageView(imageName: "breakfast_example", offset_x: -95, offset_y: 15)
                        .frame(width: 300, height: 230)
                        
                        ThoughtBubbleView(comment: "Yummy yummy breakfast ❤️")
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
                        .padding(.vertical, 5)
                        .padding(.horizontal,40)
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
    
    @State private var imageOffset: CGSize = .zero
    var imageName: String
    
    var offset_x: Double
    var offset_y: Double
    
    var body: some View {
        Image(imageName)
            .resizable()
            .cornerRadius(15.0)
            .aspectRatio(contentMode: .fit)
            .glow(color: Color("creamyCream"),radius: 30)
            .offset(x:offset_x, y:offset_y)
            .onAppear{
                withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                    imageOffset = CGSize(width: 80, height: 30)
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
