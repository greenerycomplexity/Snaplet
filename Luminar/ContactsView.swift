//
//  ContactsView.swift
//  Luminar
//
//  Created by Lewis Watson  on 13/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    private static let size: CGFloat = 100
    private static let spacingBetweenColumns: CGFloat = 25
    private static let spacingBetweenRows: CGFloat = 25
    private static let totalColumns: Int = 4
    
    let gridItems = Array(
        repeating: GridItem(
            .fixed(size),
            spacing: spacingBetweenColumns,
            alignment: .center
            ),
        count: totalColumns
    )
            
            
            
            
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea([.all])
            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                LazyVGrid(
                    columns: gridItems,
                    alignment: .center,
                    spacing: Self.spacingBetweenRows
                ) {
                    ForEach(0..<20) { value in
                        Image(profileName(value))
                            .resizable()
                            .cornerRadius(Self.size/2)
                            .frame(height: Self.size)
                            .offset(
                                x: offsetX(value),
                                y: 0
                            )
                    }
                }
            }
        }
    }
    
    func offsetX(_ value: Int) -> CGFloat {
        let rowNumber = value / gridItems.count
        
        if rowNumber % 2 == 0 {
            return Self.size / 2 + Self.spacingBetweenColumns / 2
        }
        
        return 0
    }
    
    func profileName(_ value: Int) -> String {
        profilePictures[value%profilePictures.count]
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
