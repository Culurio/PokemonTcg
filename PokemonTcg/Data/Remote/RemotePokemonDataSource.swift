//
//  RemotePokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol RemotePokemonDataSourceProtocol:Sendable {
    func fetchFromAPI(filter: PokemonFilter) async throws -> [PokemonCard]
}

actor RemotePokemonDataSource: RemotePokemonDataSourceProtocol {
    private let networkManager: PokemonNetworkManager

    init(networkManager: PokemonNetworkManager) {
        self.networkManager = networkManager
    }

    func fetchFromAPI(filter: PokemonFilter) async -> [PokemonCard] {
        var attempt = 0
        let retries = 3
        var delay: UInt64 = 300_000_000

        while attempt < retries {
            do {
                return try await networkManager.fetchCards(filter: filter)
            } catch {
                attempt += 1
                if attempt < retries {
                    try? await Task.sleep(nanoseconds: delay)
                    delay *= 2
                }
            }
        }
        return []
    }
}

