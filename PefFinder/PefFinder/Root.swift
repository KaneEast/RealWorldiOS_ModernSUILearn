//
//  Root.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/25.
//

import SwiftUI
import PefFinderOnboarding

@main
struct Root: App {
    @AppStorage(AppUserDefaultsKeys.onboarding) var shouldPresentOnboarding = true
    var body: some Scene {
        WindowGroup {
            TabView {
                AnimalsTab()
                BookedTab()
                SearchTab()
            }
            .fullScreenCover(isPresented: $shouldPresentOnboarding, onDismiss: nil) {
                PetSaveOnboardingView(items: Constants.onboardingModels)
                .onSkip { shouldPresentOnboarding = false }
            }
            .environment(\.realmConfiguration, RealmMigrator.configuration) // Realm Configurating
            //.onAppear { applyNavigationBarAppearance() }
        }
    }
    
    private func applyNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color.blue.opacity(0.25))
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
