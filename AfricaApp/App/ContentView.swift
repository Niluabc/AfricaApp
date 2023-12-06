//
//  ContentView.swift
//  Africa
//
//  Created by Nilam Shah on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    private var animals : [Animal] = Bundle.main.decode(file: "animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn : Int = 1
    @State private var toolbarIcon : String = "square.grid.2x2"
    
    // MARK : FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: {
                                AnimalDetailView(animal: animal)
                            }, label: {
                                AnimalListItemView(animal: animal)
                            })
                        }
                        
                        CopyrightView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: {
                                    AnimalDetailView(animal: animal)
                                }, label: {
                                    AnimalGridItemView(animal: animal)
                                })
                            }
                        }
                        .padding(10)
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationTitle("Africa")
            .toolbarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST
                        Button(action: {
                            print("Listview is activated")
                            haptics.impactOccurred()
                            isGridViewActive = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
                        })
                        
                        // GRID
                        Button(action: {
                            print("Gridview is activated")
                            haptics.impactOccurred()
                            isGridViewActive = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accentColor : .primary)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
