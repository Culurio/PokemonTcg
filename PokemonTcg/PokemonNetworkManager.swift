//
//  PokemonNetworkManager.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 01/07/2025.
//
import Foundation

class PokemonTCGAPI {
    static let shared = PokemonTCGAPI()
    private let baseURL = "https://api.pokemontcg.io/v2/cards"

    func fetchCards(completion: @escaping ([PokemonCard]?) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(nil)
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let response = try JSONDecoder().decode(CardListResponse.self, from: data)
                completion(response.data)
            } catch {
                print("Decoding error:", error)
                completion(nil)
            }
        }.resume()
    }
}
