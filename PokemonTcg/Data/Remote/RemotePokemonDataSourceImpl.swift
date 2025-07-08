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

    func fetchFromAPI() async -> [PokemonCard] {
        do {
            return try await networkManager.fetchCards()
        } catch {
            return []
        }
    }
}

