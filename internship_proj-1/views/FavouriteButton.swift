//
//  FavouriteButton.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 28/10/2026.
//



import SwiftUI

struct FavoriteButton: View {
    let courseID: String
    let favouritesViewModel: FavouritesViewModel
    
    var isFavorite: Bool {
        favouritesViewModel.isFavourite(courseID: courseID)
    }
    
    var body: some View {
        Button {
            favouritesViewModel.toggleFavourite(courseID: courseID)
        } label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? Color.pink : Color.gray)
        }
    }
}
