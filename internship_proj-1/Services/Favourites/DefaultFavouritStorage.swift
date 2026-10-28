//
//  DefaultFavouritStorage.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 28/10/2026.
//

import Foundation


struct DefaultFavouriteStorage: FavouriteStorage {

    private let favoritesKey = "Courses.FavoriteCourses"

    func load() -> Set<String> {
        let array = UserDefaults.standard.stringArray(forKey:favoritesKey) ?? []
        return Set(array)
    }

    func save(favouriteIDs : Set<String>) {
        UserDefaults.standard.set(Array(favouriteIDs), forKey: favoritesKey)
    }
}
