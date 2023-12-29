//
//  CoverImageView.swift
//  Africa
//
//  Created by Rodrigo Conte on 28/12/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Image("cover-lion")
                    .resizable()
                .scaledToFit()
            }//: Loop
        }//: Tabview
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - Preview

#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}
