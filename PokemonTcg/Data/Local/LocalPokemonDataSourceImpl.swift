//
//  LocalPokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

actor LocalPokemonDataSourceImpl: LocalPokemonDataSource {
    private var cache: [PokemonFilter: [PokemonCard]] = [:]

    func getCachedPokemon(for filter: PokemonFilter) async -> [PokemonCard]? {
        return cache[filter]
    }

    func save(pokemon: [PokemonCard], for filter: PokemonFilter) async {
        cache[filter] = pokemon
    }
}
