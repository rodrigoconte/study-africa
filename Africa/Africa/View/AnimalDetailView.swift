//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Rodrigo Conte on 03/01/24.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - Properties
    let animal: AnimalModel

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // MARK: - Hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // MARK: - Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // MARK: - Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                
                // MARK: - Gallery
                Group {
                    HeadingView(
                        headingImage: "photo.on.rectangle.angled",
                        headingTitle: "Wilderness in pictures"
                    )
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // MARK: - Facts
                
                // MARK: - Description
                
                // MARK: - Map
                
                // MARK: - Link
            }
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        }// - Scroll
    }
}

// MARK: - Preview

#Preview {
    @State var animals: [AnimalModel] = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    return NavigationView() {
        AnimalDetailView(animal: animals[1])
    }
    
}
