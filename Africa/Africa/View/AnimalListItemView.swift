//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Rodrigo Conte on 02/01/24.
//

import SwiftUI

struct AnimalListItemView: View {
    // MARK: - Properties
    
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                  RoundedRectangle(cornerRadius: 12)
                )
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }// - VStack
        }// - HStack
    }
}
