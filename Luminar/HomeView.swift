//
//  HomeView.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPopoverShown:Bool = true
    
    var body: some View {
        
        VStack{
            
            
            NavigationStack{
                
                Text("Prompt of the week")
                    .font(.title2)

                NavigationLink{
                    CameraView(onCaptureComplete: {}, dismissAutomaticallyOnCapture: true)
                } label: {
                    Text("🫦")
                }
            }

        }
        .popover(isPresented: $isPopoverShown) {
            
            WelcomeFirst(isPopoverShown: $isPopoverShown)
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
