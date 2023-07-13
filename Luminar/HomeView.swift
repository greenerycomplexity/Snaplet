//
//  HomeView.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPopoverShown:Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("creamyCream").ignoresSafeArea()
                
                VStack{
                    
                    Image("starbucks_example")
                        .resizable()
                        .cornerRadius(15.0)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .offset(x: 50, y:15)
                    
                    
                    Spacer()
                    
                    Text("Prompt of the week")
                        .font(.title2)
                        .bold()
                    
                    Image("breakfast_example")
                        .resizable()
                        .cornerRadius(15.0)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .offset(x: -50, y:15)
                    
    
                    
                    
                    
                    Spacer()
                    
                    NavigationLink ("Start"){
                        CameraView(onCaptureComplete: {}, dismissAutomaticallyOnCapture: true)
                            .navigationBarBackButtonHidden(true)
                            .preferredColorScheme(.dark)
                    } .buttonStyle(AccentButton())
                    
                    
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


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
