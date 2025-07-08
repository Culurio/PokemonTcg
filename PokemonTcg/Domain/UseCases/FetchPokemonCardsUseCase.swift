//
//  FetchPokemonCardsUseCase.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation

struct FetchPokemonCardsUseCase {
    private let repository: PokemonRepository

    init(repository: PokemonRepository) {
        self.repository = repository
    }

    func execute() async throws -> [PokemonCard] {
        return try await repository.fetchPokemons()
    }
}
