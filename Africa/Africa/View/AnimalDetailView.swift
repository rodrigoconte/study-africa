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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Preview

#Preview {
    @State var animals: [AnimalModel] = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    return AnimalDetailView(animal: animals[1])
}
