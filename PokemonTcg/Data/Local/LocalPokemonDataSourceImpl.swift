//
//  LocalPokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

actor LocalPokemonDataSourceImpl: LocalPokemonDataSource {
    private var cache: [PokemonCard] = []

    func getCachedPokemon() async -> [PokemonCard] {
        return cache
    }

    func save(pokemon: [PokemonCard]) async {
        cache = pokemon
    }
}


