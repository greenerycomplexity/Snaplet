//
//  ContentView.swift
//  Gradient
//
//  Created by Anastasiia on 13/7/2023.
//

import SwiftUI

struct WelcomeSecond: View {
    
    @Binding var isPopoverShown:Bool
    //Colours in gradient
    let welcomeGradientColors = [Color("ponyPink"), Color("creamyCream")]

    
    var body: some View {
        NavigationStack{
            
            ZStack {
                //Make the gradient
                LinearGradient(gradient: Gradient(colors: welcomeGradientColors), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                
                Image("Steps")
                    .padding(.top, -250.0)
                    .accessibilityLabel("Steps:")
                
                Image("1. Accept prompt")
                    .padding(.top, -60.0)
                    .accessibilityLabel("1. Accept Prompt")
                
                Image("2. Take a photo")
                    .padding(.top, 110.0)
                    .accessibilityLabel("2. Take a photo")
                
                Image("3. Invite friends")
                    .padding(.top, 270.0)
                    .accessibilityLabel("3. Invite friends")
                
                Image("4. Create Memories.")
                    .padding(.top, 430.0)
                    .accessibilityLabel("4. Create Memories.")
                
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    
                    Button {
                        isPopoverShown = false
                    } label: {
                        Text("Finish")
                            .fontWeight(.bold)
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeSecond(isPopoverShown: .constant(true))
    }
}
