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

    func fetchPokemons() async throws -> [PokemonCard] {
        let cached = await localPokemonDataSource.getCachedPokemon()
        if !cached.isEmpty {
            return cached
        } else {
            let remoteCards = try await remotePokemonDataSource.fetchFromAPI()
            await localPokemonDataSource.save(pokemon: remoteCards)
            return remoteCards
        }
    }}


