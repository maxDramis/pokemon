//
//  ContentView.swift
//  pokemon
//
//  Created by Marco Dramisino on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var pokemon = ReadData()
    
    var body: some View {
        NavigationStack {
            List (0..<pokemon.pokemonList.count, id: \.self){ i in
                NavigationLink {
                    PokemonView(pokemon: pokemon.pokemonList[i])
                } label: {
                    Text(pokemon.pokemonList[i].name.capitalized).padding([.bottom, .top], 8)
                }
            }
            .navigationTitle("My Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
