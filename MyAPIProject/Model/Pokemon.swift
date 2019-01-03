//
//  Pokemon.swift
//  MyAPIProject
//
//  Created by Nathalie  on 12/27/18.
//  Copyright © 2018 Nathalie. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [String]
    let weight: Double
    let number: String
    let height: Double
    let name: String
    let ThumbnailImage: String
    let type: [String]
}
