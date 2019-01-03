//
//  ViewController.swift
//  MyAPIProject
//
//  Created by Nathalie  on 12/27/18.
//  Copyright © 2018 Nathalie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    
    @IBOutlet weak var pokemonTableView: UITableView!
    
    var pokemon = [Pokemon]() {
        didSet {
            DispatchQueue.main.async {
                self.pokemonTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        APIClient.getAllPokemon { (pokemon, error) in
            if let pokemon = pokemon {
            self.pokemon = pokemon
            }
            if let error = error {
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = pokemonTableView.indexPathForSelectedRow,
            let pokemonDetailViewController = segue.destination as? PokemonDetailViewController else { return }
        let pokemon1 = pokemon[indexPath.row]
        pokemonDetailViewController.pokemon = pokemon1
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = pokemonTableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonCell else { fatalError("Pokemon cell not found") }
        let pokemonToSet = pokemon[indexPath.row]
        cell.pokemonName.text = pokemonToSet.name
        cell.pokemonID.text = pokemonToSet.number
        cell.pokemonImage.image = ImageClient.getImage(stringURL: pokemonToSet.ThumbnailImage)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }


}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
