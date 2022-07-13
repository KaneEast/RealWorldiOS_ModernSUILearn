//
//  PefFinderApp.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/25.
//

import SwiftUI
import PefFinderOnboarding

@main
struct PefFinderApp: App {
    
    // 1
    @AppStorage(AppUserDefaultsKeys.onboarding)
    var shouldPresentOnboarding = true
    // 2
    var onboardingModels: [OnboardingModel] {
        [
            OnboardingModel(
                title: "Welcome to\n PetSave",
                description:
                    "Looking for a Pet?\n Then you're at the right place",
                image: .bird
            ),
            OnboardingModel(
                title: "Search...",
                description:
                    "Search from a list of our huge database of animals.",
                image: .dogBoneStand
            ),
            OnboardingModel(
                title: "Nearby",
                description:
                    "Find pets to adopt from nearby your place...",
                image: .chameleon
            )
        ]
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .fullScreenCover(
                isPresented: $shouldPresentOnboarding, onDismiss: nil
            ) {
                // 2
                PetSaveOnboardingView(items: onboardingModels)
                    .onSkip { // 3
                        shouldPresentOnboarding = false
                    }
            }
            .environment(\.realmConfiguration, RealmMigrator.configuration) // Realm Configurating
        }
    }
}
