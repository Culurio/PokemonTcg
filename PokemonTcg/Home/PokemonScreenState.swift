//
//  PokemonScreenState.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation

enum PokemonScreenState {
    case idle
    case loading
    case success([PokemonCard])
    case failure(String)
}
