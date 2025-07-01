//
//  File.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 26/06/2025.
//

struct PokemonCard: Codable, Identifiable{
    let id: String
    let name: String
    let types: Array<ElementType>
    let rarity: Rarity?
    let images: CardImages
}

enum ElementType: String, CaseIterable,Codable{
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

enum Rarity: String, CaseIterable, Codable {
    case aceSpecRare = "ACE SPEC Rare"
    case amazingRare = "Amazing Rare"
    case classicCollection = "Classic Collection"
    case common = "Common"
    case doubleRare = "Double Rare"
    case hyperRare = "Hyper Rare"
    case illustrationRare = "Illustration Rare"
    case legend = "LEGEND"
    case promo = "Promo"
    case radiantRare = "Radiant Rare"
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
    case rareHoloVSTAR = "Rare Holo VSTAR"
    case rarePrime = "Rare Prime"
    case rarePrismStar = "Rare Prism Star"
    case rareRainbow = "Rare Rainbow"
    case rareSecret = "Rare Secret"
    case rareShining = "Rare Shining"
    case rareShiny = "Rare Shiny"
    case rareShinyGX = "Rare Shiny GX"
    case rareUltra = "Rare Ultra"
    case shinyRare = "Shiny Rare"
    case shinyUltraRare = "Shiny Ultra Rare"
    case specialIllustrationRare = "Special Illustration Rare"
    case trainerGalleryRareHolo = "Trainer Gallery Rare Holo"
    case ultraRare = "Ultra Rare"
    case uncommon = "Uncommon"
}

struct CardImages: Codable{
    let small: String
    let large: String
}
