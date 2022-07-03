//
//  SearchFilterView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import SwiftUI

struct SearchFilterView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        Form {
            Section {
                // 1
                Picker("Age", selection: $viewModel.ageSelection) {
                    ForEach(AnimalSearchAge.allCases, id: \.self) { age in
                        Text(age.rawValue.capitalized)
                    }
                }
                // 2
                .onChange(of: viewModel.ageSelection) { _ in
                    viewModel.search()
                }
                
                // 3
                Picker("Type", selection: $viewModel.typeSelection) {
                    ForEach(AnimalSearchType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                // 4
                .onChange(of: viewModel.typeSelection) { _ in
                    viewModel.search()
                }
            } footer: {
                Text("You can mix both, age and type, to make a more accurate search.")
            }
            
            // 5
            Button("Clear", role: .destructive, action: viewModel.clearFilters)
            Button("Done") {
                dismiss()
            }
        }
        .navigationBarTitle("Filters")
        .toolbar {
            // 6
            ToolbarItem {
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "xmark.circle.fill")
                }
            }
        }
    }
}

struct SearchFilterView_Previews: PreviewProvider {
    static var previews: some View {
//        let context = PersistenceController.preview.container.viewContext
        NavigationView {
            SearchFilterView(
                viewModel: SearchViewModel(
                    animalSearcher: AnimalSearcherMock()
                )
            )
        }
    }
}
