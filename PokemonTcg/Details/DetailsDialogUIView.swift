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
            }
            .offset(y: -20)
            ZStack(alignment: .topTrailing) {
                VStack(alignment: .leading, spacing: 12) {
                    Image("Pokeball")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1.2)
                        .background(Color("cardBackground"))
                        .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        LabeledTextRow(label: "Name", value: pokemon?.name ?? "unknown")
                        LabeledTextRow(label: "Type", value: pokemon?.type.first?.rawValue ?? "unknown")
                        LabeledTextRow(label: "Rarity", value: pokemon?.rarity.rawValue ?? "unknown")
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                }
                
                Image(systemName: "heart")
                    .scaleEffect(2)
                    .padding(20)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).fill(Color("cardTextBackground")))
            .frame(width: 340, height: 440)
        }
    }
}

#Preview {
    let mockPokemon = PokemonCard(name: "Charizard", type: [.fire], rarity: .rare)
    
    DetailsDialogUIView(pokemon: mockPokemon) {
        
    }
}
