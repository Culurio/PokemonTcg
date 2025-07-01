//
//  RemotePokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

class RemotePokemonRepositoryImpl: RemotePokemonRepository {
    func fetchFromAPI(completion: @escaping ([PokemonCard]) -> Void) {
        PokemonTCGAPI.shared.fetchCards() { cards in
            completion(cards ?? [])
        }
    }
}
