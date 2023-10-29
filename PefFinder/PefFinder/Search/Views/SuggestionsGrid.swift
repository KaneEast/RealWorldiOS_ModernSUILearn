//
//  SuggestionsGrid.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import SwiftUI

struct SuggestionsGrid: View {
    @Environment(\.isSearching) var isSearching: Bool
    
    let suggestions: [AnimalSearchType]
    var action: (AnimalSearchType) -> Void
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Browse by Type").font(.title2.bold())
            LazyVGrid(columns: columns) {
                ForEach(AnimalSearchType.suggestions, id: \.self) { suggestion in
                    Button { action(suggestion) } label: { AnimalTypeSuggestionView(suggestion: suggestion) }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal)
        .opacity(isSearching ? 0 : 1)
    }
}

#Preview {
    SuggestionsGrid(suggestions: AnimalSearchType.suggestions) { _ in }
}
