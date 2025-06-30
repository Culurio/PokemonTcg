//
//  CardUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

import SwiftUI

struct CardUIView: View {
    let pokemon: PokemonCard?
    var onTap: () -> Void


    let cardSize: CGSize = CGSize(width: 125, height: 160)
    let labelHeight: CGFloat = 40
    let cornerRadius: CGFloat = 8
    let heartSize: CGSize = CGSize(width: 24, height: 25)

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .topTrailing) {
                Color("cardBackground")
                    .overlay(
                        Image("Pokeball")
                            .resizable()
                            .scaleEffect(1.2)
                            .scaledToFill()
                            .frame(height: cardSize.height)
                    )

                Image(systemName: "heart")
                    .foregroundColor(Color("cardTextBackground"))
                    .frame(width: heartSize.width, height: heartSize.height)
                    .padding(10)
            }
            .frame(width: cardSize.width, height: cardSize.height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            Text(pokemon?.name ?? "No name")
                .frame(width: cardSize.width, height: labelHeight)
                .background(Color("cardTextBackground"))
                .foregroundColor(.white)
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .offset(y: labelHeight * 0.75)
        }
        .onTapGesture {
            onTap()
        }
    }
}


#Preview {
    let mockPokemon = PokemonCard(name: "Charizard", type: [.fire], rarity: .rare)

    CardUIView(pokemon:mockPokemon){

    }
}
