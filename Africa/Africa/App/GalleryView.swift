//
//  GalleryView.swift
//  Africa
//
//  Created by Rodrigo Conte on 27/12/23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridCollum: Double = 3.0
    
    private let animals = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Functions
    
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridCollum))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white, lineWidth: 8))
                
                Slider(value: $gridCollum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridCollum) {
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }//: Loop
                }//: Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: Vstack
            .padding(.vertical, 50)
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
