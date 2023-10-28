//
//  AnimalsContainer.swift
//  PefFinder
//
//  Created by Kanein on 2022/06/26.
//

import Foundation

struct AnimalsContainer: Decodable {
  let animals: [AnimalInfo]
  let pagination: Pagination
}
