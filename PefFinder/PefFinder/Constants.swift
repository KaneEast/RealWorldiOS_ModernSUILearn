//
//  Constants.swift
//  PefFinder
//
//  Created by Kane on 2023/10/30.
//

import Foundation
import PefFinderOnboarding

enum Constants {
    static var onboardingModels: [OnboardingModel] {
        [OnboardingModel(title: "Welcome to\n PetSave",
                         description:"Looking for a Pet?\n Then you're at the right place",
                         image: .bird),
         OnboardingModel(title: "Search...",
                         description: "Search from a list of our huge database of animals.",
                         image: .dogBoneStand),
         OnboardingModel(title: "Animals",
                         description: "Find pets to adopt for you...",
                         image: .chameleon)
        ]
    }
}
