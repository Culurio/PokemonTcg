//
//  PokemonSingleton.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation

final class PokemonSingleton {
    static let shared = PokemonSingleton()

    let localDataSource: LocalPokemonDataSource
    let remoteDataSource: RemotePokemonDataSource
    let repository: PokemonRepository
    let fetchPokemonCardsUseCase: FetchPokemonCardsUseCase

    private init() {
        self.localDataSource = LocalPokemonDataSourceImpl()
        self.remoteDataSource = RemotePokemonDataSourceImpl()
        self.repository = PokemonRepositoryImpl(local: localDataSource, remote: remoteDataSource)
        self.fetchPokemonCardsUseCase = FetchPokemonCardsUseCase(repository: repository)
    }
}
