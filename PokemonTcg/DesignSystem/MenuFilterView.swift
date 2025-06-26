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
            if filterType == "Type" {
                ForEach(ElementType.allCases, id: \.self) { type in
                    Button(type.rawValue) {
                        //TODO
                    }
                }
            } else {
                ForEach(Rarity.allCases, id: \.self) { type in
                    Button(type.rawValue) {
                        //TODO
                    }
                }
            }
        } label: {
            HStack {
                Text(filterType)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: "line.3.horizontal.decrease")
                    .foregroundColor(.black)
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
