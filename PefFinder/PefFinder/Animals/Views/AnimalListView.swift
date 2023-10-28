//
//  AnimalListView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/02.
//

import SwiftUI

struct AnimalListView<Content, Data>: View
where Content: View, Data: RandomAccessCollection, Data.Element: AnimalEntity {
    let animals: Data
    let footer: Content
    
    init(animals: Data, @ViewBuilder footer: () -> Content) {
        self.animals = animals
        self.footer = footer()
    }
    
    init(animals: Data) where Content == EmptyView {
        self.init(animals: animals) {
            EmptyView()
        }
    }
    
    var body: some View {
        List {
            ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailsView(animal: animal)) {
                    AnimalRow(animal: animal)
                }
            }
            footer
        }
        .listStyle(.plain)
    }
}

#Preview {
    Group {
        NavigationView {
            AnimalListView(animals: AnimalEntity.mock)
        }
        NavigationView {
            AnimalListView(animals: []) {
                Text("This is a footer")
            }
        }
    }
}

