//
//  ContentView.swift
//  Africa
//
//  Created by Rodrigo Conte on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    let covers = Bundle.main.decode("covers.json")
    
    // MARK: - Body
    var body: some View {
        NavigationView(content: {
            List {
                CoverImageView(covers: covers)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }// : List
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        })// : Navigation
    }
}
// MARK: - Preview
#Preview {
    ContentView()
}
