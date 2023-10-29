//
//  AooRoot.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/25.
//

import SwiftUI
import PefFinderOnboarding

@main
struct AooRoot: App {
    @AppStorage(AppUserDefaultsKeys.onboarding)
    var shouldPresentOnboarding = true
    @State private var selectedTab: Tab = .animals
    @State private var popToRootTab: Tab = .other
    
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
                title: "Animals",
                description:
                    "Find pets to adopt for you...",
                image: .chameleon
            )
        ]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            .fullScreenCover(isPresented: $shouldPresentOnboarding, onDismiss: nil) {
                PetSaveOnboardingView(items: onboardingModels)
                .onSkip { shouldPresentOnboarding = false }
            }
            .environment(\.realmConfiguration, RealmMigrator.configuration) // Realm Configurating
        }
    }
    
//    private var tabBarView: some View {
//      TabView(selection: .init(get: {
//        selectedTab
//      }, set: { newTab in
//        if newTab == selectedTab {
//          /// Stupid hack to trigger onChange binding in tab views.
//          popToRootTab = .other
//          DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
//            popToRootTab = selectedTab
//          }
//        }
//
//        HapticManager.shared.fireHaptic(of: .tabSelection)
//        SoundEffectManager.shared.playSound(of: .tabSelection)
//
//        selectedTab = newTab
//
//        DispatchQueue.main.async {
//          if selectedTab == .notifications,
//             let token = appAccountsManager.currentAccount.oauthToken
//          {
//            userPreferences.notificationsCount[token] = 0
//            watcher.unreadNotificationsCount = 0
//          }
//        }
//
//      })) {
//        ForEach(availableTabs) { tab in
//          tab.makeContentView(popToRootTab: $popToRootTab)
//            .tabItem {
//              if userPreferences.showiPhoneTabLabel {
//                tab.label
//              } else {
//                Image(systemName: tab.iconName)
//              }
//            }
//            .tag(tab)
//            .badge(badgeFor(tab: tab))
//            .toolbarBackground(theme.primaryBackgroundColor.opacity(0.50), for: .tabBar)
//        }
//      }
//      .id(appAccountsManager.currentClient.id)
//    }
}
