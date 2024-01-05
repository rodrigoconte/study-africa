//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Rodrigo Conte on 04/01/24.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - Properties
    
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }// - Loop
            }// - Hstack
        }
    }
}

#Preview {
    @State var animals: [AnimalModel] = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    
    return InsetGalleryView(animal: animals[1])
        .previewLayout(.sizeThatFits)
        .padding()
}
