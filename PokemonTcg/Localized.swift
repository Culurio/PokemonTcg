//
//  Localized.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 22/07/2025.
//

import Foundation

enum Localized {
    enum Label {
        static let name = NSLocalizedString("Name", comment: "Pokemon Name")
        static let type = NSLocalizedString("Type", comment: "Card Type")
        static let rarity = NSLocalizedString("Rarity", comment: "Card Rarity")
    }

    enum ErrorMessage {
        static let network = NSLocalizedString("No internet connection.", comment: "Network error")
        static let decoding = NSLocalizedString("Could not parse Pokémon data.", comment: "Decoding error")
        static let emptyResponse = NSLocalizedString("Pokemon not found.", comment: "Empty response error")
        static let unknown = NSLocalizedString("Something went wrong.", comment: "Unknown error")
    }
}
