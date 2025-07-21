//
//  PokemonDataError.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 21/07/2025.
//

import Foundation

enum PokemonDataError: Error {
    case network
    case decoding
    case emptyResponse
    case unknown
}
