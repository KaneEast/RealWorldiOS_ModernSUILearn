//
//  AnimalEntity.swift
//  PefFinder
//
//  Created by Kane on 2023/10/28.
//

import Foundation
import SwiftUI
import RealmSwift

class AnimalEntity: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var uuid: ObjectId
    @Persisted var id: Int?
    @Persisted var organizationId: String?
    @Persisted var rawUrl: String?
    @Persisted var type: String
    @Persisted var species: String?
    @Persisted var age: Age
    @Persisted var gender: Gender
    @Persisted var size: Size
    @Persisted var coat: Coat?
    @Persisted var name: String
    @Persisted var descriptionM: String?
    @Persisted var photoMedium: String?
    @Persisted var photoLarge: String?
    @Persisted var ranking: Int? = 0
//    @Persisted var breeds: Breed
//    var picture: URL? {
//        photos.first?.medium ?? photos.first?.large
//    }
//    var photos: [PhotoSizes] {
//        get {
//            guard let rawPhotos = rawPhotos,
//                  let pts = try? JSONDecoder().decode([PhotoSizes].self, from: rawPhotos)
//            else {
//                return []
//            }
//            
//            return pts
//        }
//        set {
//            rawPhotos = try? JSONEncoder().encode(newValue)
//        }
//    }
//    var url: URL? {
//        get { URL(string: rawUrl) }
//        set { rawUrl = newValue?.absoluteString ?? "" }
//    }
}

//// MARK: - Identifiable
//extension Animal: Identifiable {
//}
//
//struct VideoLink: Codable {
//    var id: Int?
//    var embedded: URL?
//}
//
//struct PhotoSizes: Codable {
//    var id: Int?
//    var small: URL?
//    var medium: URL?
//    var large: URL?
//    var full: URL?
//}
//
//struct Breed: Codable {
//    var id: Int?
//    var primary: String?
//    var secondary: String?
//    var mixed: Bool?
//    var unknown: Bool?
//}
//
//enum Gender: String, Codable, PersistableEnum {
//    case female = "Female"
//    case male = "Male"
//    case unknown = "Unknown"
//}
//
//struct Pagination: Codable {
//    let countPerPage: Int
//    let totalCount: Int
//    let currentPage: Int
//    let totalPages: Int
//}
//
//enum Coat: String, Codable, PersistableEnum {
//    case short = "Short"
//    case medium = "Medium"
//    case long = "Long"
//    case wire = "Wire"
//    case hairless = "Hairless"
//    case curly = "Curly"
//    case unknown = "Unknown"
//}
//
//enum Size: String, Codable, PersistableEnum {
//    case small = "Small"
//    case medium = "Medium"
//    case large = "Large"
//    case extraLarge = "Extra Large"
//    case unknown = "Unknown"
//}
//
//struct AnimalAttributes: Codable {
//    var id: Int?
//    var spayedNeutered: Bool? = false
//    var houseTrained: Bool? = false
//    var declawed: Bool? = false
//    var specialNeeds: Bool? = false
//    var shotsCurrent: Bool? = false
//}
//
//struct APIColors: Codable {
//    var id: Int?
//    var primary: String?
//    var secondary: String? = ""
//    var tertiary: String? = ""
//}
//
//struct AnimalEnvironment: Codable {
//    var id: Int?
//    var children: Bool?
//    var dogs: Bool?
//    var cats: Bool?
//}
//
//enum AdoptionStatus: String, Codable {
//    case adoptable
//    case adopted
//    case found
//    case unknown
//}
//
//enum Age: String, Codable, CaseIterable, PersistableEnum {
//    case baby = "Baby"
//    case young = "Young"
//    case adult = "Adult"
//    case senior = "Senior"
//    case unknown = "Unknown"
//}
//
//// MARK: - Agewise Color
//extension Age {
//    var color: Color {
//        switch self {
//        case .baby:
//            return .cyan
//        case .young:
//            return .orange
//        case .adult:
//            return .green
//        case .senior:
//            return .blue
//        case .unknown:
//            return .clear
//        }
//    }
//}
