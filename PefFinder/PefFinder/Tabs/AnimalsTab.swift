////
////  AnimalsTab.swift
////  PefFinder
////
////  Created by Kane on 2023/10/30.
////
//
//import Combine
//import SwiftData
//import SwiftUI
//
//@MainActor
//struct AnimalsTab: View {
////  @State private var routerPath = RouterPath()
////  @Binding var popToRootTab: Tab
//
////  @State private var didAppear: Bool = false
////  @State private var timeline: TimelineFilter = .home
////  @State private var selectedTagGroup: TagGroup?
////  @State private var scrollToTopSignal: Int = 0
//
////  @Query(sort: \LocalTimeline.creationDate, order: .reverse) var localTimelines: [LocalTimeline]
////  @Query(sort: \TagGroup.creationDate, order: .reverse) var tagGroups: [TagGroup]
//
////  @AppStorage("last_timeline_filter") var lastTimelineFilter: TimelineFilter = .home
//
//  var body: some View {
//    NavigationStack(path: $routerPath.path) {
//        AnimalListView()
//    }
//    .onAppear {
//      Task {
////        await currentAccount.fetchLists()
//      }
//    }
//    .environment(routerPath)
//  }
//}
//
