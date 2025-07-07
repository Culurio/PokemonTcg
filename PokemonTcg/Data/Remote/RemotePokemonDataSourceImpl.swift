//
//  RemotePokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

actor RemotePokemonDataSourceImpl: RemotePokemonDataSource {
    func fetchFromAPI() async -> [PokemonCard] {
        await withCheckedContinuation { continuation in
            PokemonTCGAPI.shared.fetchCards { cards in
                continuation.resume(returning: cards ?? [])
            }
        }
    }
}

