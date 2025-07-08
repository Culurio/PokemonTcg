//
//  LocalPokemonRepository.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol LocalPokemonDataSource: Sendable {
    func getCachedPokemon() async -> [PokemonCard]
    func save(pokemon: [PokemonCard]) async
}

