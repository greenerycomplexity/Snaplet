//
//  WelcomeFirst.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI
import AVFoundation

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
            
            
        }.onAppear {
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                    if response {
                        //access granted
                        
                    } else {

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
