//
//  ContentView.swift
//  pokemon
//
//  Created by Marco Dramisino on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var pokemon = ReadData()
//    @StateObject private var pokemonData = ReadData()
    
    var body: some View {
        VStack {
            List (0..<pokemon.pokemonList.count, id: \.self){ i in
                HStack {
//                    AsyncImage(url: URL(string: ""))
                    Text(pokemon.pokemonList[i].name.capitalized)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

