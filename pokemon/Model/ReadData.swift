//
//  ReadData.swift
//  pokemon
//
//  Created by Marco Dramisino on 17/05/23.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var pokemonList = [Pokemon]()
    @Published var details = [PokemonData]()
    private var urlDetails: [String] = []
    
    init(){
        loadData()
        for i in 0..<urlDetails.count{
            loadDataPokemon(path: urlDetails[i])
        }
        details.reverse()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
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
            self?.heandleResponse(data, response, error)
        }.resume()
    }
    
    func heandleResponse(_ data: Data?, _ response: URLResponse? , _ error: Error?) {
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {
            print("Error: Data not found")
            return
        }
        print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
        do {
            let resp = try JSONDecoder().decode(PokemonList.self, from: data)
            DispatchQueue.main.async { [weak self] in
                self?.pokemonList = resp.results
                let list = resp.results
                for i in 0..<list.count {
                    self?.urlDetails.append(list[i].url)
                    //                    self?.loadDataPokemon(path: list[i].url)
                }
            }
        } catch(let error) {
            print(error)
        }
    }
    
    func loadDataPokemon (path:String) {
        guard let url =  URL(string:path)
        else {
            print("File not found")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request){ [weak self] (data, response, error) in
            self?.heandleResponseImage(data, response, error)
        }.resume()
    }
    
    func heandleResponseImage(_ data: Data?, _ response: URLResponse? , _ error: Error?) {
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {
            print("Error: Data not found")
            return
        }
        print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
        do {
            let resp = try JSONDecoder().decode(PokemonData.self, from: data)
            DispatchQueue.main.async { [weak self] in
                self?.details.append(resp)
                //                for i in 0..<self!.pokemonList.count{
                //                    if(self!.pokemonList[i].name == resp.name){
                //                        self!.pokemonList[i].data = resp
                //                    }
                //                }
            }
        } catch(let error) {
            print(error)
        }
    }
}