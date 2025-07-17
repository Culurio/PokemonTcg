//
//  File.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 30/06/2025.
//

protocol PokemonRepositoryProtocol: Sendable {
    func fetchPokemons(filter: PokemonFilter) async throws -> [PokemonCard]
}

actor PokemonRepository: PokemonRepositoryProtocol {
    let localPokemonDataSource: LocalPokemonDataSourceProtocol
    let remotePokemonDataSource: RemotePokemonDataSourceProtocol

    init(local: LocalPokemonDataSourceProtocol, remote: RemotePokemonDataSourceProtocol) {
        self.localPokemonDataSource = local
        self.remotePokemonDataSource = remote
    }

    func fetchPokemons(filter: PokemonFilter) async throws -> [PokemonCard] {
        if let cached = await localPokemonDataSource.getCachedPokemon(for: filter) {
            return cached
        } else {
            let remoteCards = try await remotePokemonDataSource.fetchFromAPI(filter: filter)
            await localPokemonDataSource.save(pokemon: remoteCards, for: filter)
            return remoteCards
        }
    }
}
