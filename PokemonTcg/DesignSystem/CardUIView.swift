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

    var body: some View {
        ZStack(alignment: .bottom) {
            ImageView(pokemon: pokemon)
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
    let mockImages = CardImages(
            small: "",
            large: "https://m.media-amazon.com/images/I/71nbfl-JklS._AC_SL1024_.jpg"
        )

    let mockPokemon = PokemonCard(id: "1",name: "Charizard", types: [.fire], rarity:
            .rare,images:mockImages)
    CardUIView(pokemon:mockPokemon){

    }
}

struct ImageView: View {
    let pokemon: PokemonCard?
    let cardSize: CGSize = CGSize(width: 125, height: 160)
    let heartSize: CGSize = CGSize(width: 24, height: 25)
    let cornerRadius: CGFloat = 8
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            PokemonAsyncImageView(
                imageURL: pokemon?.images.large,
                size: CGSize(width: 125, height: 160),
                contentMode: .fit
            )
            
            Image(systemName: "heart")
                .foregroundColor(Color("cardTextBackground"))
                .frame(width: heartSize.width, height: heartSize.height)
                .padding(10)
        }
        .frame(width: cardSize.width, height: cardSize.height)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
