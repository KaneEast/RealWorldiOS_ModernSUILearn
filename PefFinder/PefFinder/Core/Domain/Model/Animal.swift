//
//  Animal.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI

struct Animal: Codable {
    var id: Int?
    let organizationId: String?
    let url: URL?
    let type: String
    let species: String?
//    var breeds: Breed
//    var colors: APIColors
    let age: Age
    let gender: Gender
//    let size: Size
//    let coat: Coat?
    let name: String
    let description: String?
    let photos: [PhotoSizes]
//    let videos: [VideoLink]
//    let status: AdoptionStatus
//    var attributes: AnimalAttributes
//    var environment: AnimalEnvironment?
//    let tags: [String]
//    var contact: Contact
//    let publishedAt: String?
//    let distance: Double?
//    var ranking: Int? = 0
    
    var picture: URL? {
        photos.first?.medium ?? photos.first?.large
    }
    
    // Todo: TestCode
    init() {
        self.id = 1
        self.organizationId = "1"
        self.url = nil
        self.type = "nil"
        self.species = "nil"
        self.name = "1"
        self.description = "1"
        self.photos = []
        self.age = .baby
        self.gender = .male
    }
}

// MARK: - Identifiable
extension Animal: Identifiable {
}

struct VideoLink: Codable {
    var id: Int?
    var embedded: URL?
}

struct PhotoSizes: Codable {
    var id: Int?
    var small: URL?
    var medium: URL?
    var large: URL?
    var full: URL?
}

struct Breed: Codable {
    var id: Int?
    var primary: String?
    var secondary: String?
    var mixed: Bool?
    var unknown: Bool?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "Unknown"
}

struct Pagination: Codable {
    let countPerPage: Int
    let totalCount: Int
    let currentPage: Int
    let totalPages: Int
}

enum Coat: String, Codable {
    case short = "Short"
    case medium = "Medium"
    case long = "Long"
    case wire = "Wire"
    case hairless = "Hairless"
    case curly = "Curly"
    case unknown = "Unknown"
}

enum Size: String, Codable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    case extraLarge = "Extra Large"
    case unknown = "Unknown"
}

struct AnimalAttributes: Codable {
    var id: Int?
    var spayedNeutered: Bool? = false
    var houseTrained: Bool? = false
    var declawed: Bool? = false
    var specialNeeds: Bool? = false
    var shotsCurrent: Bool? = false
}

struct APIColors: Codable {
    var id: Int?
    var primary: String?
    var secondary: String? = ""
    var tertiary: String? = ""
}

struct AnimalEnvironment: Codable {
    var id: Int?
    var children: Bool?
    var dogs: Bool?
    var cats: Bool?
}

enum AdoptionStatus: String, Codable {
    case adoptable
    case adopted
    case found
    case unknown
}

enum Age: String, Codable, CaseIterable {
    case baby = "Baby"
    case young = "Young"
    case adult = "Adult"
    case senior = "Senior"
    case unknown = "Unknown"
}

// MARK: - Agewise Color
extension Age {
    var color: Color {
        switch self {
        case .baby:
            return .cyan
        case .young:
            return .orange
        case .adult:
            return .green
        case .senior:
            return .blue
        case .unknown:
            return .clear
        }
    }
}
