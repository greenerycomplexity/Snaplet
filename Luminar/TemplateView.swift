//
//  TemplateView.swift
//  Templates
//
//  Created by Shabana on 17/7/2023.
//

import SwiftUI

struct TemplateView: View {
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color.gray)
                .cornerRadius(20)
            Rectangle()
                .foregroundColor(Color.teal)
                .cornerRadius(20)
            Rectangle()
                .foregroundColor(Color.gray)
                .cornerRadius(20)
            Rectangle()
                .foregroundColor(Color.teal)
                .cornerRadius(20)
        }
        .padding()
        
        
    }
}
struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
    }
}
