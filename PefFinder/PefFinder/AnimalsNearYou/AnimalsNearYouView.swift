//
//  AnimalsNearYouView.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @ObservedObject var viewModel: AnimalsNearYouViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.animals) { animal in
                Text(animal.name)
            }
        }
        .listStyle(.plain)
        .onAppear {
            Task {
                await viewModel.fetchAnimals()
            }
        }
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(viewModel: AnimalsNearYouViewModel())
    }
}
