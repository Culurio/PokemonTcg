//
//  ListUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 24/06/2025.
//

import SwiftUI

struct ListUIView: View {
    @State private var query = ""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SearchView(query: $query)

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 45) {
                        ForEach(0..<20) { number in
                            CardUIView(pokemonName: "Charizard")
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle("Pokémon")
        }
    }
}

#Preview {
  ListUIView()
}
