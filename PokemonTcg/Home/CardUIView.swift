//
//  CardUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

import SwiftUI

struct CardUIView: View {
    var pokemonName: String
    var cardSize: CGSize = CGSize(width: 125, height: 180)
    var labelHeight: CGFloat = 40
    var cornerRadius: CGFloat = 8

    var body: some View {
        ZStack(alignment: .bottom) {
            Text(pokemonName)
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
    }
}

#Preview {
    CardUIView(pokemonName: "Charizard")
}
