//
//  PokemonView.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    var pokemonData: PokemonData?
    
    init(pokemon: Pokemon, pokemonData: PokemonData?) {
        self.pokemon = pokemon
        self.pokemonData = pokemonData
    }
    
    var body: some View {
        VStack {
//            AsyncImage(url: URL(string: "")) { image in
//                if let image = image {
//                    image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 140, height: 140)
//                }
//            } placeholder: {
//                ProgressView()
//                    .frame(width: 140, height: 140)
//                
//            }
//            .background(.thinMaterial)
//            .clipShape(Circle())
            Text(pokemonData?.name.capitalized ?? "Not Found") .font(.system(size: 16, weight: .regular, design: .monospaced))
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

