//
//  FilterEnum.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 10/07/2025.
//

import Foundation

struct PokemonFilter: Equatable,Hashable {
    var showOnlyFavourites: Bool = false
    var rarity: Rarity? = nil
    var type: ElementType? = nil
    var searchQuery: String = ""
}
