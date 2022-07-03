//
//  AnimalRow.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct AnimalRow: View {
    let animal: Animal
    
    var animalName: String
    var animalDescription: String
    var animalBreedAndType: String {
        //        "\(animal.breeds) \(animal.type)"
        "\(animal.type)"
    }
    
    init(animal: Animal) {
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
                Text(animalBreedAndType)
                    .font(Font.custom("sheep_sans", size: 15, relativeTo: .callout))

                Text(animal.descriptionM ?? "")
                    .lineLimit(2)
                    .font(.footnote)
                
                HStack {
                    Text(animal.age.rawValue)
                        .modifier(AnimalAttributesCard(color: animal.age.color))
                    
                    Text(animal.gender.rawValue)
                        .modifier(AnimalAttributesCard(color: .pink))
                }
                
            }
            .lineLimit(1)
        }
    }
    
    var image: some View {
        // TODO: Image Cache
        AsyncImage(url: animal.picture) { image in
            image
                .resizable()
                .accessibilityLabel("Image of Pet")
        } placeholder: {
            Image("rw-logo")
                .resizable()
                .accessibilityLabel("Placeholder Logo")
                .overlay {
                    if animal.picture != nil {
                        ProgressView()
                            .accessibilityLabel("Image loading indicator")
                            .accessibilityHidden(true)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray.opacity(0.4))
                    }
                }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 112, height: 112)
        .cornerRadius(8)
    }
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        //        if let animal = CoreDataHelper.getTestAnimalEntity() {
        //            AnimalRow(animal: Animal())
        //        }
        
        AnimalRow(animal: Animal())
        //        Text("No Preview Now")
    }
}

