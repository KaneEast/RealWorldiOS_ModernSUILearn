//
//  AnimalRow.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct AnimalRow: View {
    let animal: AnimalEntity
    
    var animalName: String
    var animalDescription: String
    var animalBreedAndType: String {
        "\(animal.type)"
    }
    
    init(animal: AnimalEntity) {
        self.animal = animal
        animalName = animal.name
        animalDescription = animal.descriptionM ?? ""
    }
    
    var body: some View {
        HStack {
            image
            
            VStack(alignment: .leading) {
                Text(animalName)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("sheep_sans", size: 18, relativeTo: .title3))
                Text(animalBreedAndType).font(Font.custom("sheep_sans", size: 15, relativeTo: .callout))
                Text(animal.descriptionM ?? "").lineLimit(2).font(.footnote)
                HStack {
                    Text(animal.age.rawValue).modifier(AnimalAttributesCard(color: animal.age.color))
                    Text(animal.gender.rawValue).modifier(AnimalAttributesCard(color: .pink))
                }
                
            }
            .lineLimit(1)
        }
    }
    
    var image: some View {
        // TODO: k Image Cache
        AsyncImage(url: URL(string: animal.photoMedium ?? "")) { image in
            image.resizable()
        } placeholder: {
            Image("rw-logo").resizable()
            .overlay {
                if URL(string: animal.photoMedium ?? "") != nil {
                    ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.gray.opacity(0.4))
                }
            }
        }
        .aspectRatio(contentMode: .fit).frame(width: 112, height: 112).cornerRadius(8)
    }
}

// TODO: k
//#Preview {
//    AnimalRow(animal: AnimalInfo())
//}


