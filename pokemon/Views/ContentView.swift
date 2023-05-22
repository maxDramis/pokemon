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
                    PokemonView(pokemon: vm.pokemonList[i], pokemonData: vm.detailsList[i])
                } label: {
                    Text(vm.detailsList[i].name)
                        .padding([.bottom, .top], 8)
                    //                    Text(vm.pokemonList[i].name.capitalized).padding([.bottom, .top], 8)
                }
            }
//            .task {
//                try? await vm.loadData()
//                try? await Task.sleep(for: Duration.seconds(1))
//            }
            .navigationTitle("My Pokemon")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        var vm = ViewModel(wrappedValue: <#Void#>)
//        ContentView(vm: vm)
//    }
//}
