//
//  WelcomeFirst.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct WelcomeFirst: View {
    
    
    @Binding var isPopoverShown:Bool
    
    var body: some View {
        
        
        VStack{
            NavigationStack{
                
                Image(systemName: "sun.haze")
                    .scaledToFit()
                    .dynamicTypeSize(.xxxLarge)
                    .foregroundColor(.red)
                    .padding(.bottom, 2.0)
                
                Text("Welcome to Luminar!")
                    .font(.title2)
                
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button("Skip") {
                                isPopoverShown = false
                            }
                            NavigationLink{
                                Donkey(isPopoverShown: $isPopoverShown)
                                
                            }label: {
                                Text("Next")
                                    .fontWeight(.bold)
                            }
                            
                        }
                    }
                
            }
            
            
        }
        
        
        
    }
}

struct WelcomeFirst_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeFirst(isPopoverShown: .constant(true))
    }
}
