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

        func appendQueryPart(_ key: String, value: String?) {
            guard let value = value?.lowercased(), !value.isEmpty else { return }
            let formatted = value.contains(" ") ? "\"\(value)\"" : value
            queryParts.append("\(key):\(formatted)")
        }

        appendQueryPart("name", value: filter.searchQuery.isEmpty ? nil : filter.searchQuery)
        appendQueryPart("rarity", value: filter.rarity?.rawValue)
        appendQueryPart("types", value: filter.type?.rawValue)

        if !queryParts.isEmpty {
            components?.queryItems = [
                URLQueryItem(name: "q", value: queryParts.joined(separator: " "))
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
