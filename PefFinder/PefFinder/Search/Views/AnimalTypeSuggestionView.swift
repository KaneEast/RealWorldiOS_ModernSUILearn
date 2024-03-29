//
//  AnimalTypeSuggestionView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import SwiftUI

struct AnimalTypeSuggestionView: View {
    let suggestion: AnimalSearchType
    private var gradientColors: [Color] { [Color.clear, Color.black] }
    
    @ViewBuilder private var gradientOverlay: some View {
        LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .opacity(0.3)
    }
    
    var body: some View {
        suggestion.suggestionImage
        .resizable()
        .aspectRatio(1, contentMode: .fill)
        .frame(height: 96)
        .overlay(gradientOverlay)
        .overlay(alignment: .bottomLeading) {
            Text(suggestion.rawValue.capitalized.localized)
            .padding(12).foregroundColor(.white).font(.headline)
        }
        .cornerRadius(16)
    }
}

#Preview {
    Group {
        AnimalTypeSuggestionView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
        AnimalTypeSuggestionView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
            .environment(\.locale, .init(identifier: "es"))
            .previewDisplayName("Spanish Locale")
    }
    
}
