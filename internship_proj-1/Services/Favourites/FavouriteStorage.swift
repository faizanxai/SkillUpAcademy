//
//  FavouriteStorage.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 28/10/2026.
//

import Foundation


import Foundation

protocol FavouriteStorage{
    func save(favouriteIDs: Set<String>)
    func load() -> Set<String>
    
}
