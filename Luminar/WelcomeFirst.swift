//
//  WelcomeFirst.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct WelcomeFirst: View {
    
    
    @Binding var isPopoverShown:Bool
    
    @State var isOn = false
    
    var body: some View {
        
        
        VStack{
            NavigationStack{
                Spacer()
                
                Image(systemName: "sun.haze")
                    .scaledToFit()
                    .dynamicTypeSize(.xxxLarge)
                    .foregroundColor(.red)
                    .padding(.bottom, 2.0)
                
                Text("Welcome to Luminar!")
                    .font(.title2)
                Spacer()
                Text("Request camera permission:")
                Toggle("Camera", isOn: $isOn)
                    .padding()
                
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
