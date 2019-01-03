//
//  PokemonDetailViewController.swift
//  MyAPIProject
//
//  Created by Nathalie  on 1/3/19.
//  Copyright © 2019 Nathalie. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokemonName: UITextField!
    
    @IBOutlet weak var pokemonID: UITextField!
    
    @IBOutlet weak var pokemonHeight: UITextField!
    
    @IBOutlet weak var pokemonWeight: UITextField!
    
    @IBOutlet weak var pokemonType: UITextField!
    
    @IBOutlet weak var pokemonAbilities: UITextField!
    
    @IBOutlet weak var pokemonWeaknesses: UITextField!
    
    
    var pokemon: Pokemon!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePokemonUI()
    }
 
    private func updatePokemonUI() {
        pokemonImage.image = ImageClient.getImage(stringURL: pokemon.ThumbnailImage)
    }
    
}
