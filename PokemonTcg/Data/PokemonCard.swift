//
//  File.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

struct PokemonCard {
    let name: String
    let type: Array<ElementType>
    let rarity: Rarity
}

enum ElementType: String, CaseIterable {
    case colorless = "Colorless"
    case darkness = "Darkness"
    case dragon = "Dragon"
    case fairy = "Fairy"
    case fighting = "Fighting"
    case fire = "Fire"
    case grass = "Grass"
    case lightning = "Lightning"
    case metal = "Metal"
    case psychic = "Psychic"
    case water = "Water"
}

enum Rarity: String, CaseIterable{
    case amazingRare = "Amazing Rare"
    case common = "Common"
    case legend = "LEGEND"
    case promo = "Promo"
    case rare = "Rare"
    case rareAce = "Rare ACE"
    case rareBreak = "Rare BREAK"
    case rareHolo = "Rare Holo"
    case rareHoloEX = "Rare Holo EX"
    case rareHoloGX = "Rare Holo GX"
    case rareHoloLVX = "Rare Holo LV.X"
    case rareHoloStar = "Rare Holo Star"
    case rareHoloV = "Rare Holo V"
    case rareHoloVMAX = "Rare Holo VMAX"
    case rarePrime = "Rare Prime"
    case rarePrismStar = "Rare Prism Star"
    case rareRainbow = "Rare Rainbow"
    case rareSecret = "Rare Secret"
    case rareShining = "Rare Shining"
    case rareShiny = "Rare Shiny"
    case rareShinyGX = "Rare Shiny GX"
    case rareUltra = "Rare Ultra"
    case uncommon = "Uncommon"
}

