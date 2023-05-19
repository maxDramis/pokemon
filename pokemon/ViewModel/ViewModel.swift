//
//  ViewModel.swift
//  pokemon
//
//  Created by Marco Dramisino on 19/05/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var pokemonList = [Pokemon]()
    private var details: PokemonData?
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url =  URL(string:"https://pokeapi.co/api/v2/pokemon?offset=20&limit=20")
        else {
            print("File not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ [weak self] (data, response, error) in
            self?.handleResponse(data, response, error)
        }.resume()
    }
    
    func handleResponse(_ data: Data?, _ response: URLResponse? , _ error: Error?) {
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {
            print("Error: Data not found")
            return
        }
//        print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
        do {
            let resp = try JSONDecoder().decode(PokemonList.self, from: data)
            DispatchQueue.main.async { [weak self] in
                self?.pokemonList = resp.results
            }
        } catch(let error) {
            print(error)
        }
    }
    
    func getData(path: String) -> PokemonData? {
        guard let url =  URL(string:path)
        else {
            print("File not found")
            return PokemonData(id: -1, height: 120, weight: 120, name: "Cico")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ [weak self] (data, response, error) in
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
                DispatchQueue.main.async { [weak self] in
                    self?.details = resp
                }
            } catch(let error) {
                print(error)
            }
        }.resume()
        return details
    }
}
