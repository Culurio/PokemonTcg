//
//  CardUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

import SwiftUI

struct CardUIView: View {
    var pokemon: PokemonCard?
    var onTap: () -> Void  // Call this when tapped

    var cardSize: CGSize = CGSize(width: 125, height: 180)
    var labelHeight: CGFloat = 40
    var cornerRadius: CGFloat = 8

    var body: some View {
        ZStack(alignment: .bottom) {
            Text(pokemon?.name ?? "No name")
                .frame(width: cardSize.width, height: labelHeight)
                .background(Color("cardTextBackground"))
                .foregroundColor(.white)
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .offset(y: labelHeight * 0.75)
                .zIndex(0)

            ZStack(alignment: .topTrailing) {
                Color("cardBackground")
                    .overlay(
                        Image("Pokeball")
                            .resizable()
                            .scaledToFill()
                            .frame(height: cardSize.height * 0.44)
                    )

                Image(systemName: "heart")
                    .foregroundColor(.black)
                    .padding(10)
            }
            .frame(width: cardSize.width, height: cardSize.height)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .zIndex(1)
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
