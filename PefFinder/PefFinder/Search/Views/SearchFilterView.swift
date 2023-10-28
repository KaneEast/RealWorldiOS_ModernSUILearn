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
                Picker("Age", selection: $viewModel.ageSelection) {
                    ForEach(AnimalSearchAge.allCases, id: \.self) { age in
                        Text(age.rawValue.capitalized)
                    }
                }
                .onChange(of: viewModel.ageSelection) { _ in
                    viewModel.search()
                }
                
                Picker("Type", selection: $viewModel.typeSelection) {
                    ForEach(AnimalSearchType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .onChange(of: viewModel.typeSelection) { _ in
                    viewModel.search()
                }
            } footer: {
                Text("You can mix both, age and type, to make a more accurate search.")
            }
            
            Button("Clear", role: .destructive, action: viewModel.clearFilters)
            Button("Done") {
                dismiss()
            }
        }
        .navigationBarTitle("Filters")
        .toolbar {
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

#Preview {
    NavigationView {
        SearchFilterView(
            viewModel: SearchViewModel(
                animalSearcher: AnimalSearcherMock()
            )
        )
    }
}
