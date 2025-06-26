//
//  SearchView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//
import SwiftUI


struct SearchView: View {
    @Binding var query: String
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("", text: $query)
                    .textFieldStyle(PlainTextFieldStyle())
            }
            .padding(8)
            .background(Color("filterBackground"))
            .cornerRadius(8)
            
            HStack(spacing: 30) {
                MenuFilterView(filterType:"Type")
                
                MenuFilterView(filterType:"Rarity")

            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SearchView(query: .constant(""))}
