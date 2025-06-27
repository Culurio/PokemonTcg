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

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            NavigationStack {
                VStack(spacing: 0) {
                    SearchView(query: $query)

                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 45) {
                            ForEach(0..<20, id: \.self) { number in
                                let pokemon = PokemonCard(
                                    name: "Charizard \(number)",
                                    type: [.fire],
                                    rarity: .rare
                                )

                                CardUIView(pokemon: pokemon) {
                                    selectedPokemon = pokemon
                                }
                            }
                        }
                        .padding()
                    }
                }
                .navigationTitle("Pokémon")
            }

            if let selected = selectedPokemon {
                PokemonModalOverlayView(pokemon: selected) {
                    selectedPokemon = nil
                }
            }
        }
    }
}



#Preview {
    ListUIView()
}
