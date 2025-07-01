//
//  LocalPokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

class LocalPokemonRepositoryImpl: LocalPokemonRepository {
    private var cache: [PokemonCard] = []

    func getCachedPokemon() -> [PokemonCard] {
        return cache
    }

    func save(pokemon: [PokemonCard]) {
        cache = pokemon
    }
}

