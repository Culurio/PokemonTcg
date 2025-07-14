//
//  PokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 30/06/2025.
//

actor PokemonRepositoryImpl: PokemonRepository {
    let localPokemonDataSource: LocalPokemonDataSource
    let remotePokemonDataSource: RemotePokemonDataSource

    init(local: LocalPokemonDataSource, remote: RemotePokemonDataSource) {
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


