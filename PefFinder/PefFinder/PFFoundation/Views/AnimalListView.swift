//
//  AnimalListView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/02.
//

import SwiftUI

// 1
struct AnimalListView<Content, Data>: View
  where Content: View,
  Data: RandomAccessCollection,
  Data.Element: Animal {
  let animals: Data

  // 2
  let footer: Content

  // 3
  init(animals: Data, @ViewBuilder footer: () -> Content) {
    self.animals = animals
    self.footer = footer()
  }

  // 4
  init(animals: Data) where Content == EmptyView {
    self.init(animals: animals) {
      EmptyView()
    }
  }

  var body: some View {
    // 5
    List {
      ForEach(animals) { animal in
        NavigationLink(destination: AnimalDetailsView(animal: animal)) {
          AnimalRow(animal: animal)
        }
      }

      // 6
      footer
    }
    .listStyle(.plain)
  }
}

struct AnimalListView_Previews: PreviewProvider {
  static var previews: some View {
//      Text("")
    NavigationView {
      AnimalListView(animals: Animal.mock)
    }

    NavigationView {
      AnimalListView(animals: []) {
        Text("This is a footer")
      }
    }
  }
}

