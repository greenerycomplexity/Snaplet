import SwiftUI
import UIKit

struct RoundedRectangleView3: View {
    var symbolName: String
    var color: Color
    var size: CGSize
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(width: size.width, height: size.height)
            
            Image(systemName: symbolName)
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
    }
}

struct RoundedRectangleWithButton: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var color: Color
    var size: CGSize
    
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
    }
}


struct TemplatePicker: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: AppCustomisation.PinkBlueGradients), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                
                VStack{
                    Image("AddImageTemplate_text")
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    Spacer()
                    
                    ZStack{
                        // Grey rounded rectangle
                        RoundedRectangleView3(symbolName: "", color: .gray, size: CGSize(width: 320, height: 270))
                        
                        VStack{
                            HStack{
                                RoundedRectangleWithButton(color: .blue, size: CGSize(width: 90, height: 147))
                                RoundedRectangleWithButton(color: .red, size: CGSize(width: 40, height: 147))
                                RoundedRectangleWithButton(color: .green, size: CGSize(width: 159, height: 147))
                            }
                            .padding(.bottom, 3)
                            HStack{
                                RoundedRectangleWithButton(color: .yellow, size: CGSize(width: 215, height: 100))
                                RoundedRectangleWithButton(color: .orange, size: CGSize(width: 87, height: 100))
                            }
                        }
                    }
                    Spacer()
                    HStack{
                        let randomPeople = Array(Set(profilePictures)).prefix(5)
                        
                        ForEach(randomPeople, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70)
                                .clipShape(Circle())
                        }
                        
                    }
                    
                    Spacer()
                    
                    NavigationLink{
//                        This is not ideal. Change pending.
                        HomeView().navigationBarBackButtonHidden(true)
                     } label: {
                         Image("invite_text")
                             .scaleEffect(0.8)
                             .frame(width: 210, height: 60)
                             .background(Color("ponyPink"))
                             .clipShape(RoundedRectangle(cornerRadius: 20))
                             .padding(.top,2.0)
                     }
                    
                    
                }
                
                
                
                
            }
        }
    }
}


struct AddImageTemplate_Previews: PreviewProvider {
    static var previews: some View {
        TemplatePicker()
    }
}
