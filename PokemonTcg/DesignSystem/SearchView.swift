//
//  SearchView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//
import SwiftUI

struct SearchView: View {
    @Binding var query: String
    @Binding var selectedType: ElementType?
    @Binding var selectedRarity: Rarity?

    @State var debounceText:String = ""

    private func write() async {
        query = debounceText
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)

                TextField("Search...", text: $debounceText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .task(id: debounceText) {
                        if !debounceText.isEmpty {
                            try? await Task.sleep(for: .seconds(1.5))
                            guard !Task.isCancelled else {return}
                        }
                        await write()
                    }
            }
            .padding(8)
            .background(Color("filterBackground"))
            .cornerRadius(8)

            HStack(spacing: 30) {
                MenuFilterView(
                    category: .type,
                    selectedType: $selectedType,
                    selectedRarity: $selectedRarity
                )

                MenuFilterView(
                    category: .rarity,
                    selectedType: $selectedType,
                    selectedRarity: $selectedRarity
                )
            }
        }
        .padding()
    }
}

#Preview {
    SearchView(query: .constant(""), selectedType: .constant(nil), selectedRarity: .constant(nil))
}
