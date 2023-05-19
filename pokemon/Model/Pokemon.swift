//
//  Pokemon.swift
//  pokemon
//
//  Created by Marco Dramisino on 17/05/23.
//

import Foundation

struct PokemonList: Decodable , Identifiable{
    let id = UUID()
    var results: [Pokemon]
    var count: Int
    var next: String
    var previous: String
}

struct Pokemon: Decodable {
    let name: String
    let url: String
    var data: PokemonData?
}

struct PokemonData: Decodable {
    let abilities: [String]?
    let base_experience: Int?
    let forms: [String]?
    let game_indices: [String]?
    let height: Int
    let held_items: [String]?
    let id: Int
    let is_default: Bool
    let location_area_encounters: String
    let moves: [String]?
    let name: String
    let order: Int
    let past_types: [String]?
    let species: [String]?
    let sprites: Sprites?
    let stats: [String]?
    let types: [String]?
    let weight: Int
}

struct Sprites: Decodable {
    let back_default: String
    let back_female: String?
    let back_shiny: String
    let back_shiny_female: String?
    let front_default: String
    let front_female: String?
    let front_shiny: String
    let front_shiny_female: String?
}
