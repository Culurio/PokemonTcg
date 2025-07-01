//
//  PokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 30/06/2025.
//

class PokemonRepositoryImpl: PokemonRepository {
    let localPokemonRepository: LocalPokemonRepository
    let remotePokemonRepository: RemotePokemonRepository

    init(local: LocalPokemonRepository, remote: RemotePokemonRepository) {
        self.localPokemonRepository = local
        self.remotePokemonRepository = remote
    }

    func fetchPokemons(completion: @escaping ([PokemonCard]) -> Void) {
        let cached = localPokemonRepository.getCachedPokemon()
        if !cached.isEmpty {
            completion(cached)
        } else {
            remotePokemonRepository.fetchFromAPI { [weak self] remoteCards in
                self?.localPokemonRepository.save(pokemon: remoteCards)
                completion(remoteCards)
            }
        }
    }
}

