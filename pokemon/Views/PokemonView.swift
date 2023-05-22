//
//  PokemonView.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: pokemon.data?.sprites.back_default ?? "")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 140)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: 140, height: 140)
                
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            Text("ID: \(pokemon.data?.id ?? 0)").font(.system(size: 16, weight: .regular, design: .monospaced))
            Text("Name: \(pokemon.name.capitalized)").font(.system(size: 20, weight: .bold, design: .monospaced)).padding(.bottom, 4)
            Text("Weight: \(pokemon.data?.weight ?? 0)").font(.system(size: 16, weight: .regular, design: .monospaced))
            Text("Height:  \(pokemon.data?.height ?? 0)").font(.system(size: 16, weight: .regular, design: .monospaced))
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

