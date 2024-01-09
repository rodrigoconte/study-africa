//
//  InsetFactView.swift
//  Africa
//
//  Created by Rodrigo Conte on 08/01/24.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - Propeties
    let animal: AnimalModel
    // MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minWidth: 148, minHeight: 168, maxHeight: 180)
        }
    }
}

#Preview {
    var animals: [AnimalModel] = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    return InsetFactView(animal: animals[3])
}
