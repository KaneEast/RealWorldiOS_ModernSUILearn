//
//  Tabs.swift
//  PefFinder
//
//  Created by Kane on 2023/10/30.
//

import SwiftUI

@MainActor
enum Tab: Int, Identifiable, Hashable {
  case animals, booked, search, other

  nonisolated var id: Int {
    rawValue
  }

  static func loggedOutTab() -> [Tab] {
      [.animals, .booked, .search]
  }

  static func loggedInTabs() -> [Tab] {
    if UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac {
      return [.animals, .booked, .search]
    } else {
      return [.animals, .booked, .search]
    }
  }

  @ViewBuilder
  func makeContentView(popToRootTab: Binding<Tab>) -> some View {
    switch self {
    case .Animals:
      TimelineTab(popToRootTab: popToRootTab)
    case .Booked:
      TimelineTab(popToRootTab: popToRootTab, timeline: .trending)
    case .Search:
      TimelineTab(popToRootTab: popToRootTab, timeline: .local)
    case .other:
      EmptyView()
    }
  }

  @ViewBuilder
  var label: some View {
    switch self {
    case .animals:
      Label("tab.timeline", systemImage: iconName)
    case .booked:
      Label("tab.trending", systemImage: iconName)
    case .search:
      Label("tab.local", systemImage: iconName)
    case .other:
      EmptyView()
    }
  }

  var iconName: String {
    switch self {
    case .animals:
      "rectangle.stack"
    case .booked:
      "chart.line.uptrend.xyaxis"
    case .search:
      "person.2"
    case .other:
      ""
    }
  }
}

