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
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.white).shadow(radius: 10).padding(.horizontal, 30).padding(.vertical, 60)
            VStack {
                Text("ID: \(pokemon.data?.id ?? 0)").font(.system(size: 16, weight: .ultraLight, design: .monospaced))
                PokemonImage(path: pokemon.data?.sprites.back_default ?? "")
                VStack (alignment: .leading){
                    Text("Name: \(pokemon.name.capitalized)").font(.system(size: 20, weight: .bold, design: .monospaced)).padding(.bottom, 4)
                    Text("Weight:    \(pokemon.data?.weight ?? 0)").font(.system(size: 14, weight: .regular, design: .monospaced))
                    Text("Height:    \(pokemon.data?.height ?? 0)").font(.system(size: 14, weight: .regular, design: .monospaced))
                    Text("Default:  \(pokemon.data?.is_default == true ? "True" : "False")").font(.system(size: 14, weight: .regular, design: .monospaced))
                    Text("Order:     \(pokemon.data?.order ?? 0)").font(.system(size: 14, weight: .regular, design: .monospaced)).padding(.bottom, 6)
                    Text("Experience: \(pokemon.data?.base_experience ?? 0)").font(.system(size: 16, weight: .regular, design: .monospaced))
                }
                
            }
            .navigationTitle(pokemon.name.capitalized)
        }
    }
}
