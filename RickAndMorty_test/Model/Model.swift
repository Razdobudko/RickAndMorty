//
//  Model.swift
//  RickAndMorty_test
//
//  Created by Veranika Razdabudzka on 15.04.22.
//

import UIKit

struct Model: Codable {
    var results: [Results]
}

struct Results: Codable {
    var name: String?
    var status: String?
    var species: String?
    var gender: String?
    var location: Locations
    var image: String?
    var episode: [String]
}

struct Locations: Codable {
    var name: String?
}

