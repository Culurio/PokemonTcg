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

    let localDataSource: LocalPokemonDataSource
    let remoteDataSource: RemotePokemonDataSource
    let repository: PokemonRepository
    let fetchPokemonCardsUseCase: FetchPokemonCardsUseCase
    let networkManager: PokemonNetworkManager

    private init() {
        self.networkManager = PokemonNetworkManager()
        self.localDataSource = LocalPokemonDataSourceImpl()
        self.remoteDataSource = RemotePokemonDataSourceImpl(networkManager: networkManager)
        self.repository = PokemonRepositoryImpl(local: localDataSource, remote: remoteDataSource)
        self.fetchPokemonCardsUseCase = FetchPokemonCardsUseCase(repository: repository)
    }
}
