//
//  FavouritesRepository.swift
//  PokemonTcg
//
//  Created by Cláudio Costa on 10/07/2025.
//

import Foundation

protocol FavouritesProtocol{
    func getFavouriteIDs() -> Set<String>
    func updateFavouriteStorage(for id: String, isFavourite: Bool)
}

class FavouritesRepository: FavouritesProtocol {
    private let favouritesKey = "favouriteCardIDs"

    func getFavouriteIDs() -> Set<String> {
        let ids = UserDefaults.standard.stringArray(forKey: favouritesKey) ?? []
        return Set(ids)
    }

    func updateFavouriteStorage(for id: String, isFavourite: Bool) {
        var favouriteIDs = getFavouriteIDs()
        if isFavourite {
            favouriteIDs.insert(id)
        } else {
            favouriteIDs.remove(id)
        }
        UserDefaults.standard.set(Array(favouriteIDs), forKey: favouritesKey)
    }
}
