//
//  ListUIView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 24/06/2025.
//

import SwiftUI

struct ListUIView: View {
    @State private var query = ""

    var body: some View {
        Search(query: $query)
    }
}

struct Search: View {
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
            .background(Color(AppColors.filterBackground))
            .cornerRadius(8)
            
            HStack(spacing: 30) {
                MenuFilter(filterType:"Type")
                
                MenuFilter(filterType:"Rarity")

            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ListUIView()
}

struct MenuFilter: View {
    var filterType: String
    var body: some View {
        Menu {
            // Type options
        } label: {
            HStack {
                Text(filterType)
                    .foregroundColor(Color.black)
                Spacer()
                Image(systemName: "line.3.horizontal.decrease")
                    .foregroundColor(Color.black)
            }
            .padding()
            .background(Color(AppColors.filterBackground))
            .cornerRadius(8)
        }
    }
}
