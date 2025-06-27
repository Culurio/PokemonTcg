//
//  PokemonModalOverlayView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 27/06/2025.
//

import SwiftUI

struct PokemonModalOverlayView: View {
    let pokemon: PokemonCard
    let onDismiss: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onDismiss()
                }

            DetailsDialogUIView(pokemon: pokemon) {
                onDismiss()
            }
            .transition(.scale)
        }
    }
}
#Preview {
    let mockPokemon = PokemonCard(name: "Charizard", type: [.fire], rarity: .rare)

    PokemonModalOverlayView(pokemon:mockPokemon){
        
    }
}
