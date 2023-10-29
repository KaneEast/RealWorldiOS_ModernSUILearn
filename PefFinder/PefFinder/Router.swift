//
//  Router.swift
//  PefFinder
//
//  Created by Kane on 2023/10/30.
//

import Combine
import Foundation
import Observation
import SwiftUI

public enum RouterDestination: Hashable {
    case animals
    case booked
    case search
    case animalDetail
}

public enum SheetDestination: Identifiable {
    case addAccount
    
    public var id: String {
        switch self {
        case .addAccount:
            "addAccount"
        }
    }
}

@MainActor
@Observable public class RouterPath {
    public var path: [RouterDestination] = []
    public var presentedSheet: SheetDestination?
    public init() {}
    public func navigate(to: RouterDestination) {
        path.append(to)
    }
}

