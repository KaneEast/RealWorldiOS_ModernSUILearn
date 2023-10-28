//
//  AnimalDetailsView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/02.
//

import SwiftUI

struct AnimalDetailsView: View {
    @State var zoomed = false
    @State var favorited = false
    
//    let animal: AnimalEntity
    @ObservedObject var vm: AnimalDetailsViewModel
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .leading) {
                    LazyVStack(alignment: .leading) {
                        AnimalHeaderView(
                            vm: vm,
                            zoomed: $zoomed,
                            geometry: geometry)
                        .onTapGesture { zoomed.toggle() }
                        Divider()
                            .blur(radius: zoomed ? 20 : 0)
                        PetRankingView(animal: vm.animal)
                            .padding()
                            .blur(radius: zoomed ? 20 : 0)
                        AnimalDetailRow(animal: vm.animal)
                            .blur(radius: zoomed ? 20 : 0)
                        Divider()
                            .blur(radius: zoomed ? 20 : 0)
                        VStack(alignment: .leading, spacing: 24) {
                            if let description = vm.animalDescription {
                                VStack(alignment: .leading) {
                                    Text("Details")
                                        .font(.headline)
                                    Text(description)
                                        .accessibility(label: Text("Details about this pet: " + description))
                                }
                            }
                        }
                        .blur(radius: zoomed ? 20 : 0)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .animation(.spring(), value: zoomed)
                }
            }
        }
        .navigationTitle(vm.animalName ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            AnimalDetailsView(vm: AnimalDetailsViewModel(animal: AnimalEntity.mock.first!))
        }
        .previewLayout(.sizeThatFits)
        .previewDisplayName("iPhone SE (2nd generation)")
        
        NavigationView {
            AnimalDetailsView(vm: AnimalDetailsViewModel(animal: AnimalEntity.mock.first!))
        }
        .previewDevice("iPhone 12 Pro")
        .previewDisplayName("iPhone 12 Pro")
    }
}
