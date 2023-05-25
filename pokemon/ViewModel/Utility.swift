//
//  utility.swift
//  pokemon
//
//  Created by Marco Dramisino on 25/05/23.
//

import Foundation

enum NetworkError : Error {
    case dataNotFound
    case timeOut
}

enum ResultDataNetwork {
    case success(PokemonData), failure(NetworkError)
}
