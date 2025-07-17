//
//  ListUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 24/06/2025.
//

import SwiftUI

struct ListUIView: View {
    @State private var rotationAngle: Double = 0
    @State private var query = ""
    @State var filterType: ElementType? = nil
    @State var filterRarity: Rarity? = nil
    @State private var selectedPokemonID: String? = nil
    @StateObject private var viewModel: PokemonViewModel

    let layout: ListLayoutStyle

    init(layout: ListLayoutStyle) {
        _viewModel = StateObject(wrappedValue: PokemonViewModel())
        self.layout = layout
    }

    private var selectedPokemon: PokemonCard? {
        guard
            let id = selectedPokemonID,
            case let .success(cards) = viewModel.state
        else { return nil }

        return cards.first(where: { $0.id == id })
    }

    private func reloadWithFilters() {
        let filter = PokemonFilter(
            showOnlyFavourites: layout == .favorites,
            rarity: filterRarity,
            type: filterType,
            searchQuery: query
        )

        viewModel.loadPokemons(filter: filter)
    }

    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    SearchView(query: $query, selectedType: $filterType, selectedRarity: $filterRarity)
                    content
                        .padding()
                }
                .onAppear {
                    reloadWithFilters()
                }
                .onChange(of: query){
                    reloadWithFilters()
                }
                .onChange(of: filterType) {
                    reloadWithFilters()
                }

                .onChange(of: filterRarity) {
                    reloadWithFilters()
                }
            }

            modalOverlay
        }
    }

    private var modalOverlay: some View {
        Group {
            if let pokemon = selectedPokemon {
                PokemonModalOverlayView(
                    pokemon: pokemon,
                    onToggleFavourite: {
                        viewModel.toggleFavourite(for: pokemon)
                    },
                    onDismiss: {
                        selectedPokemonID = nil
                    }
                )
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
            case .idle, .loading:
                loadingView

            case .failure(let message):
                errorView(message: message)

            case .success(let cards):
                cardsGrid(cards)
        }
    }

    private var loadingView: some View {
        VStack {
            Image("Pokeball")
                .resizable()
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: rotationAngle))
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                }
                .onDisappear {
                    rotationAngle = 0
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Image("ErrorImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(message)
                .foregroundColor(.red)
            Button("Retry"){
                reloadWithFilters()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    private func cardsGrid(_ cards: [PokemonCard]) -> some View {
        ScrollView {
            LazyVGrid(columns: layout.columns, spacing: layout.spacing) {
                ForEach(cards) { pokemon in
                    cardView(for: pokemon)
                }
            }
        }
    }

    @ViewBuilder
    private func cardView(for pokemon: PokemonCard) -> some View {
        if layout == .home {
            CardUIView(
                pokemon: pokemon,
                onTap: { selectedPokemonID = pokemon.id },
                onToggleFavourite: { viewModel.toggleFavourite(for: pokemon, layout: layout) }
            )
        } else {
            CardFavouriteUIView(
                pokemon: pokemon,
                onToggleFavourite: { viewModel.toggleFavourite(for: pokemon, layout: layout) },
                onTap: { selectedPokemonID = pokemon.id }
            )
        }
    }
}

enum ListLayoutStyle {
    case home
    case favorites

    var columns: [GridItem] {
        switch self {
            case .home:
                [GridItem(.flexible()), GridItem(.flexible())]
            case .favorites:
                [GridItem(.flexible())]
        }
    }

    var spacing: CGFloat {
        switch self {
            case .home: 45
            case .favorites: 24
        }
    }
}


#Preview {
    ListUIView(layout: .home)
}
