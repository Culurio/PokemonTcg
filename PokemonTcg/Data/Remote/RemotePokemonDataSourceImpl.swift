//
//  RemotePokemonRepositoryImpl.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

actor RemotePokemonDataSourceImpl: RemotePokemonDataSource {
    private let networkManager: PokemonNetworkManager

    init(networkManager: PokemonNetworkManager) {
        self.networkManager = networkManager
    }

    func fetchFromAPI(filter: PokemonFilter) async -> [PokemonCard] {
        do {
            return try await networkManager.fetchCards(filter: filter)
        } catch {
            return []
        }
    }
}

