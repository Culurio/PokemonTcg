//
//  RemotePokemonRepository.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol RemotePokemonDataSource:Sendable {
    func fetchFromAPI() async throws -> [PokemonCard]
}

