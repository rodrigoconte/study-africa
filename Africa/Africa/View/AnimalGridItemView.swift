//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Rodrigo Conte on 26/01/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - Properties
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    let animals = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    return AnimalGridItemView(animal: animals[3])
}
