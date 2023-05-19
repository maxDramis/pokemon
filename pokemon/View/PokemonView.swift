//
//  PokemonView.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject private var pokemonInstance = ReadData()
    var pokwmon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokwmon = pokemon
        pokemonInstance.loadDataPokemon(path:pokemon.url)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokwmon.data?.sprites?.back_default ?? ""))
            Text(pokwmon.name.capitalized)
            Text(pokwmon.data?.name.capitalized ?? "nul")
        }
        .navigationTitle(pokwmon.name.capitalized)
    }
}

