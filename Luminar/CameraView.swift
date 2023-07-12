//
//  CameraView.swift
//  CameraTutorial2
//
//  Created by Lewis Watson on 7/7/2023.
//

import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIImagePickerController
    
    var onCaptureComplete: (() -> Void)?
    var dismissAutomaticallyOnCapture = false
    
    @Environment(\.dismiss) var dismiss
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> CameraView.Coordinator {
        return Coordinator(self)
    }
}

extension CameraView {
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
            //print("here 1")
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // insert here and replace the print to go back to the previous screen
            print("Cancel pressed")
            
            if parent.dismissAutomaticallyOnCapture {
                parent.dismiss()
            }
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                // insert here and replace the save photo
                // this will lead to the layout picker screen
                print("Photo saved")
                //NavigationLink(destination: FramePickerView())
                parent.onCaptureComplete?()
                
                if parent.dismissAutomaticallyOnCapture {
                    parent.dismiss()
                }
            }
        }
    }
}
