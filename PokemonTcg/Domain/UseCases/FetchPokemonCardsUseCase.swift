//
//  FetchPokemonCardsUseCase.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation

struct FetchPokemonCardsUseCase {
    private let repository: PokemonRepositoryProtocol

    init(repository: PokemonRepositoryProtocol) {
        self.repository = repository
    }

    func execute(filter: PokemonFilter) async throws -> [PokemonCard] {
        do {
            let pokemons = try await repository.fetchPokemons(filter: filter)
            guard !pokemons.isEmpty else {
                throw PokemonDataError.emptyResponse
            }
            return pokemons
        } catch {
            switch error {
                case is URLError:
                    throw PokemonDataError.network
                case is DecodingError:
                    throw PokemonDataError.decoding
                case let pokemonError as PokemonDataError:
                    throw pokemonError
                default:
                    throw PokemonDataError.unknown
            }
        }
    }
}
