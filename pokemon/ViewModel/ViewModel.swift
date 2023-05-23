//
//  ViewModel.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokemonList = [Pokemon]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url =  URL(string:"https://pokeapi.co/api/v2/pokemon?offset=20&limit=10")
        else {
            print("File not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ [weak self] (data, response, error) in
            self?.handleResponse(data, response, error, completition: { pokemonList in
                self?.pokemonList = pokemonList
            })
        }.resume()
    }
    
    func handleResponse(_ data: Data?, _ response: URLResponse? , _ error: Error?, completition: @escaping ([Pokemon]) -> Void ) {
        let group = DispatchGroup()
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {
            print("Error: Data not found")
            return
        }
        do {
            let resp = try JSONDecoder().decode(PokemonList.self, from: data)
            var list = resp.results
            for i in 0..<list.count {
                group.enter()
                let currentUrl = list[i].url
                self.getData(path: currentUrl) { data in
                    list[i].data = data
                    group.leave()
                }
            }
            group.notify(queue: .main) {
                completition(list)
            }
        } catch(let error) {
            print(error)
        }
    }
    
    func getData(path: String, completition: @escaping (PokemonData) -> Void ) {
        guard let url =  URL(string:path)
        else {
            print("File not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {
                print("Error: Data not found")
                return
            }
            do {
                let resp = try JSONDecoder().decode(PokemonData.self, from: data)
                completition(resp)
                
            } catch(let error) {
                print(error)
            }
        }.resume()
    }
}
