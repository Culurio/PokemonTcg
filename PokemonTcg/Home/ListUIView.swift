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
    let layout: ListLayoutStyle

    var columns: [GridItem] {
        switch layout {
        case .home:
            return [GridItem(.flexible()), GridItem(.flexible())]
        case .favorites:
            return [GridItem(.flexible())]
        }
    }

    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    SearchView(query: $query)

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: layout == .home ? 45 : 24) {
                            ForEach(0..<20, id: \.self) { number in
                                let pokemon = PokemonCard(
                                    name: "Charizard \(number)",
                                    type: [.fire],
                                    rarity: .rare
                                )

                                if layout == .home {
                                    CardUIView(pokemon: pokemon) {
                                        selectedPokemon = pokemon
                                    }
                                } else {
                                    CardFavouriteUIView(pokemon: pokemon) {
                                        selectedPokemon = pokemon
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }

            if let selected = selectedPokemon {
                PokemonModalOverlayView(pokemon: selected) {
                    selectedPokemon = nil
                }
            }
        }
    }
}


enum ListLayoutStyle {
    case home
    case favorites
}



#Preview {
    ListUIView(layout: ListLayoutStyle.favorites)
}
