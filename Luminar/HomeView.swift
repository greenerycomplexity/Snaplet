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
    
    let homeGradientColors = [Color("ponyPink"), Color("babyBlue")]
    
    @State var floating1 = 10.0
    
    var body: some View {
        NavigationStack{
            ZStack{
                // Background gradient for home view
                LinearGradient(gradient: Gradient(colors: homeGradientColors), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                
                VStack{
                    
                    // First image
                    ZStack{
                        Image("toddler_mess_img")
                            .resizable()
                            .cornerRadius(15.0)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 200)
                            .offset(x: 80, y: floating1)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                     floating1 = 5
                                }
                            }
                        
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
                        
                    }
                    
                    Spacer()
                    
                    
                    // Second image
                    ZStack{
                        Image("breakfast_example")
                            .resizable()
                            .cornerRadius(15.0)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 230)
                            .offset(x: -95, y:15)
                        
                        ThoughtBubbleView(comment: "Yummy yummy breakfast ❤️")
                            .offset(x:-18, y: 20)
                            .scaleEffect(1.2)
                    }
                    
                    
                    Spacer()
                    
                    
                    // Move to camera view
                    NavigationLink{
                        CameraView(onCaptureComplete: {}, dismissAutomaticallyOnCapture: true)
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


struct BouncingView: View {
    @State private var bouncing = false
    var body: some View {
        Text("Hello, World!")
            .frame(maxHeight: .infinity, alignment: bouncing ? .bottom : .top)
            .animation(Animation.easeInOut(duration: 5.0).repeatForever(autoreverses: true), value: bouncing)
            .onAppear {
                self.bouncing.toggle()
            }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
