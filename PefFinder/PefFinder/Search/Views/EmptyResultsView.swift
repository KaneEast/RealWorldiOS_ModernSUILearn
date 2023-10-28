//
//  EmptyResultsView.swift
//  PefFinder
//
//  Created by Kanein on 2022/07/03.
//

import SwiftUI

struct EmptyResultsView: View {
    let query: String
    var body: some View {
        VStack {
            Image(systemName: "pawprint.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .padding()
                .foregroundColor(.yellow)
            Text("Sorry, we couldn't find animals for \"\(query)\"")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyResultsView(query: "Kiki")
}
