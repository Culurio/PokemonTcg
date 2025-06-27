//
//  LabeledTextRow.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 27/06/2025.
//

import SwiftUI

struct LabeledTextRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(value)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    LabeledTextRow(label: "Name", value: "Charizard")
}
