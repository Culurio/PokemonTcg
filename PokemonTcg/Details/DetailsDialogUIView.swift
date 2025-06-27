//
//  DetailsUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 27/06/2025.
//

import SwiftUI

struct DetailsDialogUIView: View {
    var pokemon: PokemonCard?
     var onClose: () -> Void

     var body: some View {
         VStack(spacing: 0) {
             Button(action: onClose) {
                 Image(systemName: "xmark")
                     .foregroundColor(.black)
                     .padding()
                     .background(Circle().fill(Color.white))
                     .shadow(radius: 3)
             }
             .offset(y: -20)

             VStack(alignment: .leading, spacing: 12) {
                 ZStack(alignment: .topTrailing) {
                     Image("Pokeball")
                         .resizable()
                         .scaledToFit()
                         .frame(height: 180)
                         .background(Color("cardBackground"))
                         .cornerRadius(12)

                     Image(systemName: "heart")
                         .padding(10)
                 }

                 VStack(alignment: .leading, spacing: 6) {
                     LabeledTextRow(label: "Name", value: pokemon?.name ?? "unknown") // is there a way for this fall back be inside the enum
                     LabeledTextRow(label: "Type", value: pokemon?.type[0].rawValue ?? "unknown")
                     LabeledTextRow(label: "Rarity", value: pokemon?.rarity.rawValue ?? "unknown")
                 }
                 .font(.subheadline)
                 .padding(.horizontal)
             }
             .padding()
             .background(RoundedRectangle(cornerRadius: 8).fill(Color("cardTextBackground")))
             .frame(width: 300)
         }
     }
 }

#Preview {
    let mockPokemon = PokemonCard(name: "Charizard", type: [.fire], rarity: .rare)

    DetailsDialogUIView(pokemon: mockPokemon) {
        
    }
}
