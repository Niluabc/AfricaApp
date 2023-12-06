//
//  GalleryView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct GalleryView: View {
    // SIMPLE GRID DEFINITION
    // let gridLayout : [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // EFFICIENT GRID DEFINITION
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3
    
    @State private var selectedAnimal : String = "lion"
    
    let hapticFeedback = UIImpactFeedbackGenerator()
    
    var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    
    // FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // MARK : SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) {
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                hapticFeedback.impactOccurred()
                                selectedAnimal = item.image
                            }
                    }
                } // : LazyVGrid
                .animation(Animation.easeIn, value: UUID())
                .onAppear {
                    gridSwitch()
                }
            } // : VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } // : Scrollview
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

#Preview {
    GalleryView()
}
