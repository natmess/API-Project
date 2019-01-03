//
//  APIClient.swift
//  MyAPIProject
//
//  Created by Nathalie  on 12/27/18.
//  Copyright © 2018 Nathalie. All rights reserved.
//

import UIKit

enum AppError {
    case badURL(String)
    case badData(Error)
    case badDecoding(Error)
}


final class APIClient {
    static func getAllPokemon(completionHandler: @escaping (([Pokemon]?, AppError?) -> Void)) {
        guard let url = URL.init(string: "https://www.pokemon.com/us/api/pokedex/kalos") else { completionHandler(nil, .badURL("url not working"))
            return }
        let urlRequest = URLRequest.init(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error {
                completionHandler(nil, .badData(error))
            }
            
            if let data = data {
                do {
                   var pokemonData = try JSONDecoder().decode([Pokemon].self, from: data)
                    var pokemonSet = Set<String>()
                    pokemonData = pokemonData.filter { (pokemonObjectName) -> Bool in
                        
                        if pokemonSet.contains(where: { (pokemonName) -> Bool in
                            pokemonObjectName.name == pokemonName
                        }) {
                            
                            return false
                        } else {
                            pokemonSet.insert(pokemonObjectName.name)
                           return true
                        }
                    }
                    
                    completionHandler(pokemonData, nil)
                    
                } catch {
                    
                   
                    completionHandler(nil, .badDecoding(error))
                }
            }
        }.resume()
    }
}

final class ImageClient {
    static func getImage(stringURL: String) -> UIImage? {
        guard let myImageURL = URL.init(string: stringURL) else { return nil }
        do {
            let data = try Data.init(contentsOf: myImageURL)
            guard let image = UIImage.init(data: data) else { return nil }
            return image
        } catch {
            print(error)
            return nil
        }
    }
}
