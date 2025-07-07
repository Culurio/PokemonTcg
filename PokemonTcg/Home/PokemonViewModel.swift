//
//  PokemonViewModel.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    @Published var state: PokemonScreenState = .idle

    private let fetchPokemonCardsUseCase: FetchPokemonCardsUseCase

    init(fetchPokemonCardsUseCase: FetchPokemonCardsUseCase) {
        self.fetchPokemonCardsUseCase = fetchPokemonCardsUseCase
    }

    func loadPokemons() {
        Task {
            await MainActor.run {
                self.state = .loading
            }

            do {
                let cards = try await fetchPokemonCardsUseCase.execute()
                await MainActor.run {
                    self.state = .success(cards)
                }
            } catch {
                await MainActor.run {
                    self.state = .failure("Failed to load Pokémon.")
                }
            }
        }
    }

}
