//
//  ContentView.swift
//  Africa
//
//  Created by Rodrigo Conte on 20/12/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let covers = Bundle.main.decode([CoverModel].self, from: "covers.json")
    let animals = Bundle.main.decode([AnimalModel].self, from: "animals.json")
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var isGridViewActive: Bool = false
    @State private var gridCollum: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - Methods
    private func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridCollum = gridLayout.count
        
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView(content: {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView(covers: covers)
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }// - Link
                        }// : Loop
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }// - Link
                            }// : Loop
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn)
                    }// : Scroll
                }// : Condition
            }// : Group
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("List view clicked")
                            isGridViewActive = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accentColor)
                        })
                        
                        Button(action: {
                            print("Grid view clicked")
                            isGridViewActive = true
                            gridSwitch()
                            
                            switch gridCollum {
                            case 1:
                                toolbarIcon = "square.grid.2x2"
                            case 2:
                                toolbarIcon = "square.grid.3x2"
                            case 3:
                                toolbarIcon = "rectangle.grid.1x2"
                            default:
                                toolbarIcon = "square.grid.2x2"
                            }
                            
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        })
                    }// : HStack
                }// : Buttons
            })// : Toolbar
        })// : Navigation
    }
}
// MARK: - Preview
#Preview {
    ContentView()
}
