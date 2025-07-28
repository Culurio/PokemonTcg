//
//  PokemonSingleton.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation

@MainActor
final class PokemonContainer {
    static let shared = PokemonContainer()

    let localDataSource: LocalPokemonDataSourceProtocol
    let remoteDataSource: RemotePokemonDataSourceProtocol
    let repository: PokemonRepositoryProtocol
    let fetchPokemonCardsUseCase: FetchPokemonCardsUseCase
    let networkManager: PokemonNetworkManager
    let networkMonitor: NetworkMonitor

    private init() {
        self.networkManager = PokemonNetworkManager()
        self.networkMonitor = NetworkMonitor()
        self.localDataSource = LocalPokemonDataSource()
        self.remoteDataSource = RemotePokemonDataSource(networkManager: networkManager)
        self.repository = PokemonRepository(local: localDataSource, remote: remoteDataSource)
        self.fetchPokemonCardsUseCase = FetchPokemonCardsUseCase(repository: repository)
    }
}
