//
//  PokemonNetworkManager.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//
import Foundation

final class PokemonNetworkManager: Sendable {
    private let baseURL = "https://api.pokemontcg.io/v2/cards"

    func fetchCards(filter: PokemonFilter) async throws -> [PokemonCard] {
        var components = URLComponents(string: baseURL)
        var queryParts: [String] = []

        if let rarity = filter.rarity?.rawValue.lowercased() {
            let formattedRarity = rarity.contains(" ") ? "\"\(rarity)\"" : rarity
            queryParts.append("rarity:\(formattedRarity)")
        }

        if let type = filter.type?.rawValue.lowercased() {
            let formattedType = type.contains(" ") ? "\"\(type)\"" : type
            queryParts.append("types:\(formattedType)")
        }

        if !queryParts.isEmpty {
            let query = queryParts.joined(separator: " ")
            components?.queryItems = [
                URLQueryItem(name: "q", value: query)
            ]
        }

        guard let url = components?.url else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(CardListResponse.self, from: data)
        return response.data
    }
}

