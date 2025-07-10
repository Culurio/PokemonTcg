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
    private let favouritesRepository: FavouritesProtocol

    init() {
        self.fetchPokemonCardsUseCase = PokemonContainer.shared.fetchPokemonCardsUseCase
        self.favouritesRepository = FavouritesRepository()
    }

    func loadPokemons() {
        self.state = .loading

        Task {
            do {
                var cards = try await fetchPokemonCardsUseCase.execute()
                let favouriteIDs = favouritesRepository.getFavouriteIDs()

                for i in cards.indices {
                    cards[i].isFavourite = favouriteIDs.contains(cards[i].id)
                }

                self.state = .success(cards)
            } catch {
                self.state = .failure("Failed to load Pokémon.")
            }
        }
    }

    func loadFavouritePokemons() {
        self.state = .loading

        Task {
            do {
                let cards = try await fetchPokemonCardsUseCase.execute()
                let favouriteIDs = favouritesRepository.getFavouriteIDs()

                let favouriteCards = cards
                    .filter { favouriteIDs.contains($0.id) }
                    .map { card -> PokemonCard in
                        var mutableCard = card
                        mutableCard.isFavourite = true
                        return mutableCard
                    }

                self.state = .success(favouriteCards)
            } catch {
                self.state = .failure("Failed to load favourite Pokémon.")
            }
        }
    }


    func toggleFavourite(for card: PokemonCard, layout: ListLayoutStyle = .home) {
        guard case .success(var cards) = state else { return }

        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            cards[index].isFavourite.toggle()
                favouritesRepository.updateFavouriteStorage(for: card.id, isFavourite: cards[index].isFavourite)

            if layout == .favorites && !cards[index].isFavourite {
                cards.remove(at: index)
            }

            self.state = .success(cards)
        }
    }
}
