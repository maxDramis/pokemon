//
//  PokemonView.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import SwiftUI

struct PokemonView: View {
    @State private var p = ReadData()
    var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "")) { image in
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
            //            AsyncImage(url: URL(string: pokwmon.data?.sprites?.back_default ?? ""))
            Text(pokemon.name.capitalized) .font(.system(size: 16, weight: .regular, design: .monospaced))
            Text(p.details[0].name.capitalized)
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

