//
//  RemotePokemonRepository.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//

import Foundation

protocol RemotePokemonRepository {
    func fetchFromAPI(completion: @escaping ([PokemonCard]) -> Void)
}
