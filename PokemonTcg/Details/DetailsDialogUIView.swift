//
//  DetailsUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 27/06/2025.
//

import SwiftUI

struct DetailsDialogUIView: View {
    var pokemon: PokemonCard?
    var onToggleFavourite: () -> Void
    var onClose: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Button(action: onClose) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .padding()
                    .background(Circle().fill(Color.white))
            }
            .offset(y: -20)
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading, spacing: 12) {
                    PokemonAsyncImageView(
                        imageURL: pokemon?.images.large,
                        cornerRadius: 12
                    )

                    VStack(alignment: .leading, spacing: 6) {
                        LabeledTextRow(label: Localized.Label.name, value: pokemon?.name ?? "unknown")
                        LabeledTextRow(label: Localized.Label.type, value: pokemon?.types.first?.localized ?? "unknown")
                        LabeledTextRow(label: Localized.Label.rarity, value: pokemon?.rarity?.localized ?? "unknown")
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                }

                Button(action: {
                    onToggleFavourite()
                    print("IsFavourite state \(pokemon?.isFavourite ?? true)")
                }) {
                    Image(systemName: pokemon?.isFavourite ?? true ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .scaleEffect(2)
                        .padding(20)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("cardTextBackground")))
            .frame(width: 340, height: 440)
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

    DetailsDialogUIView(pokemon: mockPokemon, onToggleFavourite: {}) {

    }
}
