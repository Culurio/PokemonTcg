//
//  File.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 30/06/2025.
//

protocol PokemonRepository {
    func fetchPokemons() async throws -> [PokemonCard]
}
