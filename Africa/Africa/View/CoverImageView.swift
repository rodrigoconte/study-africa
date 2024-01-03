//
//  CoverImageView.swift
//  Africa
//
//  Created by Rodrigo Conte on 28/12/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    let covers: [CoverModel]
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(covers) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            }//: Loop
        }//: Tabview
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - Preview

#Preview {
    CoverImageView(covers: Bundle.main.decode([CoverModel].self, from: "covers.json"))
        .previewLayout(.fixed(width: 400, height: 300))
}
