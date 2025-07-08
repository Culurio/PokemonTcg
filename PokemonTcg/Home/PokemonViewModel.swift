//
//  PokemonViewModel.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 07/07/2025.
//

import SwiftUI

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var state: PokemonScreenState = .idle

    private let fetchPokemonCardsUseCase: FetchPokemonCardsUseCase

    init() {
        self.fetchPokemonCardsUseCase = PokemonContainer.shared.fetchPokemonCardsUseCase
    }

    func loadPokemons() {
        self.state = .loading

        Task {
            do {
                let cards = try await fetchPokemonCardsUseCase.execute()
                self.state = .success(cards)
            } catch {
                self.state = .failure("Failed to load Pokémon.")
            }
        }
    }

}
