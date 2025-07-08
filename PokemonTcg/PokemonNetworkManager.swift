//
//  PokemonNetworkManager.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//
import Foundation

final class PokemonNetworkManager: Sendable {
    private let baseURL = "https://api.pokemontcg.io/v2/cards"

    func fetchCards() async throws -> [PokemonCard] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CardListResponse.self, from: data)
        return response.data
    }
}
