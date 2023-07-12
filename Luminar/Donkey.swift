//
//  Donkey.swift
//  Luminar
//
//  Created by Mason Cao on 11/7/2023.
//

import SwiftUI

struct Donkey: View {
    
    @Binding var isPopoverShown:Bool
    
    var body: some View {
        
        NavigationStack{
            Text("🫏")
                .font(.system(size: 120))
        
            Text("Here's how the app works")
                .fontWeight(.bold)
                .font(.title2)
            
            Text("1: Prompts are given weekly")
                .padding(0.5)
            Text("2: Capture moments")
                .padding(0.5)
            Text("3: Add and collaborate on a shared template")
            
            
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

struct Donkey_Previews: PreviewProvider {
    static var previews: some View {
        Donkey(isPopoverShown: .constant(true))
    }
}
