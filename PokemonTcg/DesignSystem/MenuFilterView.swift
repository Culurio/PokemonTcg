//
//  MenuFilterView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//
import SwiftUI


struct MenuFilterView: View {
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
            .background(Color("filterBackground"))
            .cornerRadius(8)
        }
    }
}

#Preview {
    MenuFilterView(filterType: "Filter")
}
