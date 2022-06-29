//
//  Animal.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import SwiftUI
import RealmSwift

class Animal: Object, ObjectKeyIdentifiable, Codable {
    @Persisted(primaryKey: true) var uuid: ObjectId
    
    @Persisted var id: Int?
    @Persisted var organizationId: String?
    
    var url: URL? {
        get { URL(string: rawUrl) }
        set { rawUrl = newValue?.absoluteString ?? "" }
    }
    
    @Persisted var rawUrl: String
    
    @Persisted var type: String
    @Persisted var species: String?
    @Persisted var age: Age
    @Persisted var gender: Gender
    @Persisted var size: Size
    @Persisted var coat: Coat?
    @Persisted var name: String
    @Persisted var descriptionM: String?
    
    var photos: [PhotoSizes] {
        get {
            guard let rawPhotos = rawPhotos,
                  let pts = try? JSONDecoder().decode([PhotoSizes].self, from: rawPhotos)
            else {
                return []
            }
            
            return pts
        }
        set {
            rawPhotos = try? JSONEncoder().encode(newValue)
        }
    }
    @Persisted var rawPhotos: Data?
    
    //    var breeds: Breed
    //    var colors: APIColors
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
    
    // Todo: this code is for just now
    override init() {
        self.id = 1
        self.organizationId = "1"
        self.rawUrl = ""
        self.type = "nil"
        self.species = "nil"
        self.name = "1"
        self.descriptionM = "description"
        self.rawPhotos = nil
        self.age = .baby
        self.gender = .male
        self.size = .small
        self.coat = .curly
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case organizationId
        case url
        case type
        case species
        case name
        case descriptionM = "description"
        case photos
        case age
        case gender
        case size
        case coat
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int?.self, forKey: .id)
        self.organizationId = try container.decode(String?.self, forKey: .organizationId)
        let url = try container.decode(URL.self, forKey: .url)
        self.type = try container.decode(String.self, forKey: .type)
        self.species = try container.decode(String?.self, forKey: .species)
        self.name = try container.decode(String.self, forKey: .name)
        self.descriptionM = try container.decode(String?.self, forKey: .descriptionM)
        self.age = try container.decode(Age.self, forKey: .age)
        self.gender = try container.decode(Gender.self, forKey: .gender)
        self.size = try container.decode(Size.self, forKey: .size)
        self.coat = try container.decode(Coat?.self, forKey: .coat)
        let photos = try container.decode([PhotoSizes].self, forKey: .photos)
        
        self.rawUrl = url.absoluteString
        self.rawPhotos = try? JSONEncoder().encode(photos)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(organizationId, forKey: .organizationId)
        try container.encode(url, forKey: .url)
        try container.encode(type, forKey: .type)
        try container.encode(species, forKey: .species)
        try container.encode(name, forKey: .name)
        try container.encode(descriptionM, forKey: .descriptionM)
        try container.encode(age, forKey: .age)
        try container.encode(gender, forKey: .gender)
        try container.encode(size, forKey: .size)
        try container.encode(coat, forKey: .coat)
        try container.encode(photos, forKey: .photos)
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

enum Gender: String, Codable, PersistableEnum {
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

enum Coat: String, Codable, PersistableEnum {
    case short = "Short"
    case medium = "Medium"
    case long = "Long"
    case wire = "Wire"
    case hairless = "Hairless"
    case curly = "Curly"
    case unknown = "Unknown"
}

enum Size: String, Codable, PersistableEnum {
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

enum Age: String, Codable, CaseIterable, PersistableEnum {
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
