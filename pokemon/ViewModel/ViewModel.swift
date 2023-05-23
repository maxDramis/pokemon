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
        let group = DispatchGroup()
        guard let url =  URL(string:"https://pokeapi.co/api/v2/pokemon?offset=20&limit=20")
        else {
            print("File not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        group.enter()
        URLSession.shared.dataTask(with: request){ [weak self] (data, response, error) in
            self?.handleResponse(data, response, error)
            group.leave()
            group.notify(queue: .main){
                print("Work Done")
            }
        }.resume()
    }
    
    func handleResponse(_ data: Data?, _ response: URLResponse? , _ error: Error?) {
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
            group.enter()
            let resp = try JSONDecoder().decode(PokemonList.self, from: data)
            self.pokemonList = resp.results
            for i in 0..<(self.pokemonList.count) {
                let currentUrl = self.pokemonList[i].url
                self.getData(path: currentUrl) { data in
                    self.pokemonList[i].data = data
                }
                
            }
            group.leave()
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
