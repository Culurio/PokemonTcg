//
//  MenuFilterView.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//
import SwiftUI


enum FilterCategory {
    case type
    case rarity
}

struct MenuFilterView: View {
    var category: FilterCategory
    @Binding var selectedType: ElementType?
    @Binding var selectedRarity: Rarity?

    var body: some View {
        Menu {
            if category == .type {
                filterButton(label: "All Types", isSelected: selectedType == nil) {
                    selectedType = nil
                }

                ForEach(ElementType.allCases, id: \.self) { type in
                    filterButton(label: type.rawValue, isSelected: selectedType == type) {
                        selectedType = type
                    }
                }
            }

            if category == .rarity {
                filterButton(label: "All Rarities", isSelected: selectedRarity == nil) {
                    selectedRarity = nil
                }

                ForEach(Rarity.allCases, id: \.self) { rarity in
                    filterButton(label: rarity.rawValue, isSelected: selectedRarity == rarity) {
                        selectedRarity = rarity
                    }
                }
            }
        } label: {
            HStack {
                Text(labelText)
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

    @ViewBuilder
    private func filterButton(label: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack {
                Text(label)
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }

    private var labelText: String {
        switch category {
            case .type:
                return selectedType?.rawValue ?? "Type"
            case .rarity:
                return selectedRarity?.rawValue ?? "Rarity"
        }
    }
}



#Preview {
    MenuFilterView(
        category: .type,
        selectedType: .constant(nil),
        selectedRarity: .constant(nil)
    )
}
