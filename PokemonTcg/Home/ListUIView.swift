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
        SearchView(query: $query)
    }
}


#Preview {
    ListUIView()
}


