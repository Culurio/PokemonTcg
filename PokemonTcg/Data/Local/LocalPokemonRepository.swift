//
//  LocalPokemonRepository.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol LocalPokemonRepository {
    func getCachedPokemon() -> [PokemonCard]
    func save(pokemon: [PokemonCard])
}
