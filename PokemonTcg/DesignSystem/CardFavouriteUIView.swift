//
//  CardUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

import SwiftUI

struct CardFavouriteUIView: View {
    var pokemon: PokemonCard?
    var onTap: () -> Void

    private let cardWidth: CGFloat = 120
    private let cardHeight: CGFloat = 100
    private let heartSize: CGFloat = 24

    var body: some View {
        HStack(alignment: .top) {
            Text(pokemon?.name ?? "No name")
                .foregroundColor(.white)
                .font(.body)
                .padding(.top, 5)
            
            Spacer()

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color("cardBackground"))

                PokemonAsyncImageView(
                    imageURL: pokemon?.images.large,
                    contentMode: .fit
                )

                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: heartSize, height: heartSize)
                    .foregroundColor(.black)
                    .padding(6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
            .frame(width: cardWidth, height: cardHeight)
        }
        .padding()
        .background(Color("cardTextBackground"))
        .cornerRadius(10)
        .onTapGesture(perform: onTap)
    }
}



#Preview {
    let mockImages = CardImages(
            small: "",
            large: "https://m.media-amazon.com/images/I/71nbfl-JklS._AC_SL1024_.jpg"
        )

    let mockPokemon = PokemonCard(id: "1",name: "Charizard", types: [.fire], rarity:
            .rare,images:mockImages)

    CardFavouriteUIView(pokemon:mockPokemon){
        
    }
}
