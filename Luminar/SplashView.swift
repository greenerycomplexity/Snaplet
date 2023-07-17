//
//  ContentView.swift
//  Splash Screen
//
//  Created by Shabana on 12/7/2023.
//

import SwiftUI
    
    

struct SplashView: View {
    let homeGradientColors = [Color("ponyPink"), Color("babyBlue")]
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: homeGradientColors), startPoint: .top, endPoint: .bottom)
                                .edgesIgnoringSafeArea(.vertical)
            
            Image("snaplet_text")

        }
    }
}


class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the SwiftUI view and set it as the view of the view controller
        let splashView = SplashView()
        let hostingController = UIHostingController(rootView: splashView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.didMove(toParent: self)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
