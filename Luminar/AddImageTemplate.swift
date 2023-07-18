//
//  ContentView3.swift
//  SW PhotoTemplate
//
//  Created by Steph Worladge on 17/7/2023.
//

import SwiftUI
import UIKit

struct RoundedRectangleView3: View {
    var symbolName: String
    var color: Color
    var size: CGSize
    var position: CGPoint
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: size.width, height: size.height)
            
            Image(systemName: symbolName)
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
        .position(position)
    }
}

struct RoundedRectangleWithButton: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var color: Color
    var size: CGSize
    var position: CGPoint
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: size.width, height: size.height)
            
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: size.width, height: size.height)
            } else {
                Button(action: {
                    self.showImagePicker = true
                }) {
                    Image(systemName: "photo")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $selectedImage)
                }
            }
        }
        .position(position)
    }
}


struct TemplatePicker: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: AppCustomisation.PinkBlueGradients), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.vertical)
            
            // Grey rounded rectangle
            RoundedRectangleView3(symbolName: "", color: .gray, size: CGSize(width: 320, height: 270), position: CGPoint(x: 199, y: 354))
            
            // Five rounded corner rectangles
            RoundedRectangleWithButton(color: .blue, size: CGSize(width: 90, height: 147), position: CGPoint(x: 95, y: 300))
            
            RoundedRectangleWithButton(color: .red, size: CGSize(width: 40, height: 147), position: CGPoint(x: 165, y: 300))
            
            RoundedRectangleWithButton(color: .green, size: CGSize(width: 159, height: 147), position: CGPoint(x: 270, y: 300))
            
            RoundedRectangleWithButton(color: .yellow, size: CGSize(width: 215, height: 100), position: CGPoint(x: 152, y: 430))
            
            RoundedRectangleWithButton(color: .orange, size: CGSize(width: 87, height: 100), position: CGPoint(x: 306, y: 430))
        }
    }
}


struct AddImageTemplate_Previews: PreviewProvider {
    static var previews: some View {
        TemplatePicker()
    }
}
