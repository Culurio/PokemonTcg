//
//  PokemonModalOverlayView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 27/06/2025.
//

import SwiftUI

struct PokemonModalOverlayView: View {
    let pokemon: PokemonCard
    let onToggleFavourite: () -> Void
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismiss()
                }

            DetailsDialogUIView(
                pokemon: pokemon,
                onToggleFavourite: onToggleFavourite
            ) {
                onDismiss()
            }
            .transition(.scale)
        }
    }
}
#Preview {
    let mockImages = CardImages(
                small: "",
                large: "https://m.media-amazon.com/images/I/71nbfl-JklS._AC_SL1024_.jpg"
            )

        let mockPokemon = PokemonCard(id: "1",name: "Charizard", types: [.fire], rarity:
                .rare,images:mockImages)

    PokemonModalOverlayView(
        pokemon: mockPokemon,
        onToggleFavourite: {},
        onDismiss: {},
    )
}
