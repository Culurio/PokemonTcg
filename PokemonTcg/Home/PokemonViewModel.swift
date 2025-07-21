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

    func loadPokemons(filter: PokemonFilter = PokemonFilter()) {
        self.state = .loading

        Task {
            do {
                var cards = try await fetchPokemonCardsUseCase.execute(filter: filter)
                let favouriteIDs = favouritesRepository.getFavouriteIDs()

                for i in cards.indices {
                    cards[i].isFavourite = favouriteIDs.contains(cards[i].id)
                }

                if filter.showOnlyFavourites {
                    cards = cards.filter { favouriteIDs.contains($0.id) }
                }

                self.state = .success(cards)
            } catch let error as PokemonDataError {
                switch error {
                    case .network:
                        self.state = .failure("No internet connection.")
                    case .decoding:
                        self.state = .failure("Could not parse Pokémon data.")
                    case .emptyResponse:
                        self.state = .failure("Pokemon not found.")
                    case .unknown:
                        self.state = .failure("Something went wrong.")
                }
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
