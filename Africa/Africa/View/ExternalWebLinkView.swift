//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Rodrigo Conte on 08/01/24.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - Properties
    
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link)!)
                }
                .foregroundStyle(.accent)
            }// - Hstack
        }// - GroupBox
    }
}

#Preview {
    @State var animals: [AnimalModel] = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    return ExternalWebLinkView(animal: animals[0])
}
