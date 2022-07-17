//
//  PetRankingView.swift
//  PefFinder
//
//  Created by Kane on 2022/07/17.
//

import SwiftUI

struct PetRankingView: View {
    @ObservedObject var viewModel: PetRankingViewModel
    var animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
        viewModel = PetRankingViewModel(animal: animal)
    }
    
    var body: some View {
        HStack {
            Text("Rank me!")
                .multilineTextAlignment(.center)
            ForEach(0...4, id: \.self) { index in
                PetRankImage(index: index, recentIndex: $viewModel.ranking)
            }
        }
    }
}

struct PetRankImage: View {
    let index: Int
    @State var opacity: Double = 0.4
    @State var tapped = false
    @Binding var recentIndex: Int
    
    var body: some View {
        Image("creature_dog-and-bone")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(opacity)
            .frame(width: 50, height: 50)
            .onTapGesture {
                opacity = tapped ? 0.4 : 1.0
                tapped.toggle()
                recentIndex = index
            }
            .onChange(of: recentIndex) { value in
                checkOpacity(value: value)
            }
            .onAppear {
                checkOpacity(value: recentIndex)
            }
    }
    
    func checkOpacity(value: Int) {
        opacity = value >= index ? 1.0 : 0.4
        tapped.toggle()
    }
}

final class PetRankingViewModel: ObservableObject {
    var animal: Animal
    var ranking: Int {
        didSet {
            animal.ranking = ranking
            objectWillChange.send()
        }
    }
    
    init(animal: Animal) {
        self.animal = animal
        self.ranking = animal.ranking ?? 0
    }
}

struct PetRankingView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = Animal.mock.first {
            Group {
                PetRankingView(animal: animal)
                    .padding()
                    .previewLayout(.sizeThatFits)
                    .environment(\.sizeCategory, .extraSmall)
                    .previewDisplayName("Extra-Small")
                
                PetRankingView(animal: animal)
                    .padding()
                    .previewLayout(.sizeThatFits)
                    .previewDisplayName("Regular")
                
                PetRankingView(animal: animal)
                    .padding()
                    .previewLayout(.sizeThatFits)
                    .environment(\.sizeCategory, .extraLarge)
                    .previewDisplayName("Extra-Large")
            }
        }
    }
}

