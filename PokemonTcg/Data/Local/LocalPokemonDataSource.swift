//
//  LocalPokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol LocalPokemonDataSourceProtocol: Sendable {
    func getCachedPokemon(for filter: PokemonFilter) async -> [PokemonCard]?
    func save(pokemon: [PokemonCard], for filter: PokemonFilter) async
}

actor LocalPokemonDataSource: LocalPokemonDataSourceProtocol {
    private var cache: [PokemonFilter: [PokemonCard]] = [:]

    func getCachedPokemon(for filter: PokemonFilter) async -> [PokemonCard]? {
        return cache[filter]
    }

    func save(pokemon: [PokemonCard], for filter: PokemonFilter) async {
        guard !pokemon.isEmpty else {
            return
        }
        cache[filter] = pokemon
    }
}
