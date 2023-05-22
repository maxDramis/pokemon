//
//  ContentView.swift
//  pokemon
//
//  Created by Marco Dramisino on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm:ViewModel
    
    var body: some View {
        NavigationStack {
            List (0..<vm.pokemonList.count, id: \.self){ i in
                NavigationLink {
                    PokemonView(pokemon: vm.pokemonList[i])
                } label: {
                    Text(vm.pokemonList[i].name.capitalized)
                        .padding([.bottom, .top], 8)
                }
            }
            .navigationTitle("My Pokemon")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }
}
