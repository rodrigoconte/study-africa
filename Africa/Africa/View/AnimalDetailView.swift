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
                Group {
                    HeadingView(
                        headingImage: "questionmark.circle",
                        headingTitle: "Did you know?"
                    )
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                // MARK: - Description
                Group {
                    HeadingView(
                        headingImage: "info.circle",
                        headingTitle: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                // MARK: - Map
                Group {
                    HeadingView(
                        headingImage: "map",
                        headingTitle: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                // MARK: - Link
                Group {
                    HeadingView(
                        headingImage: "books.vertical",
                        headingTitle: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
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
