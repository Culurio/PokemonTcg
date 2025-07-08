//
//  ListUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 24/06/2025.
//

import SwiftUI

struct ListUIView: View {
    @State private var query = ""
    @State private var selectedPokemon: PokemonCard? = nil
    @StateObject private var viewModel: PokemonViewModel

    let layout: ListLayoutStyle

    init(layout: ListLayoutStyle) {
        _viewModel = StateObject(wrappedValue: PokemonViewModel())
        self.layout = layout
    }

    private var columns: [GridItem] {
        layout == .home
            ? [GridItem(.flexible()), GridItem(.flexible())]
            : [GridItem(.flexible())]
    }

    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    SearchView(query: $query)
                    content
                        .padding()
                }
                .onAppear(perform: viewModel.loadPokemons)
            }

            if let pokemon = selectedPokemon {
                PokemonModalOverlayView(pokemon: pokemon) {
                    selectedPokemon = nil
                }
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
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    private func errorView(message: String) -> some View {
        VStack(spacing: 12) {
            Text(message)
                .foregroundColor(.red)
            Button("Retry", action: viewModel.loadPokemons)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    private func cardsGrid(_ cards: [PokemonCard]) -> some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: layout == .home ? 45 : 24) {
                ForEach(cards) { pokemon in
                    cardView(for: pokemon)
                }
            }
        }
    }

    @ViewBuilder
    private func cardView(for pokemon: PokemonCard) -> some View {
        let select = { selectedPokemon = pokemon }

        if layout == .home {
            CardUIView(pokemon: pokemon, onTap: select)
        } else {
            CardFavouriteUIView(pokemon: pokemon, onTap: select)
        }
    }
}


enum ListLayoutStyle {
    case home
    case favorites
}



#Preview {
   ListUIView(layout: ListLayoutStyle.home)
}
