//
//  HomeView.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPopoverShown:Bool = true
    @State private var animationAmount = 1.0
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("home_gradient")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack{
                    
                    Image("starbucks_example")
                        .resizable()
                        .cornerRadius(15.0)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .offset(x: 80, y:15)
                    
                    
                    Spacer()
                    
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
                    
                    
                    
                    Image("breakfast_example")
                        .resizable()
                        .cornerRadius(15.0)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 230)
                        .offset(x: -95, y:15)
                    
                    
                        .animation(.interpolatingSpring(stiffness: 50, damping: 1).repeatForever(autoreverses: true), value: animationAmount)
                    
                    
                        .onAppear{
                            animationAmount = 2.0
                        }
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    HStack{
                        NavigationLink ("Start"){
                            CameraView(onCaptureComplete: {}, dismissAutomaticallyOnCapture: true)
                                .navigationBarBackButtonHidden(true)
                                .preferredColorScheme(.dark)
                        } .buttonStyle(AccentButton())
                        
                        
                        NavigationLink ("Contacts"){
                            ContactsView()
                                .preferredColorScheme(.dark)
                        } .buttonStyle(AccentButton())
                    }
                    
                    
                }
                
            }
            .popover(isPresented: $isPopoverShown) {
                
                WelcomeFirst(isPopoverShown: $isPopoverShown)
            }
            
        }
        
    }
    
}


struct AccentButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("ponyPink"))
            .foregroundStyle(.white)
            .clipShape(Capsule())
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
