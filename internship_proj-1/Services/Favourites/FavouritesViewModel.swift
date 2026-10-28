//
//  FavouritesViewModel.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 28/10/2026.
//

import Foundation




import Foundation
import Observation
@Observable
class FavouritesViewModel{
    
   private(set) var favouritesIDs : Set<String> = []
    private let service :FavouriteStorage
    
    init( service: FavouriteStorage = DefaultFavouriteStorage()) {
       self.service = service
    }
    func load(){
        favouritesIDs = service.load()
    }
    
   private func save(){
        service.save(favouriteIDs: favouritesIDs)
    }
    
    func toggleFavourite (courseID :String){
        if favouritesIDs.contains(courseID){
            favouritesIDs.remove(courseID)
        }
        else
        {
            favouritesIDs.insert(courseID)
        }
        save()
        
    }
    
    func isFavourite(courseID:String) -> Bool{
        favouritesIDs.contains(courseID)
    }

}
