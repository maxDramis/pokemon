//
//  GridView.swift
//  pokemon
//
//  Created by Marco Dramisino on 25/05/23.
//

import SwiftUI

struct GridView: View {
    @StateObject var vm:ViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 15) {
                    ForEach (0..<vm.pokemonList.count, id: \.self){ i in
                        GridRow {
                            NavigationLink {
                                PokemonView(pokemon: vm.pokemonList[i])
                            } label: {
                                VStack{
                                    PokemonImage(path: vm.pokemonList[i].data?.sprites.back_default ?? "")
                                    Text(vm.pokemonList[i].name.capitalized)
                                        .padding([.bottom, .top], 8)
                                }
                            }
                        }.padding(.bottom, 10 )
                    }
                }.animation(.easeInOut(duration: 0.4), value: vm.pokemonList.count)
                    .navigationTitle("Pokedex")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(vm: ViewModel())
    }
}
