//
//  HeadingView.swift
//  Africa
//
//  Created by Rodrigo Conte on 04/01/24.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - Properties
    
    let headingImage: String
    let headingTitle: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            Text(headingTitle)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingTitle: "Wilderness in pictures")
}
