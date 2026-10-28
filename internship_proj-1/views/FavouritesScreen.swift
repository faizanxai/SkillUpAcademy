//
//  FavouritesScreen.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 28/10/2026.
//

import SwiftUI

struct FavouritesScreen: View {

    let coursesViewModel: CoursesViewModel
    let favouritesViewModel: FavouritesViewModel

    var courses: [Course] {
        let favourites = favouritesViewModel.favouritesIDs

        switch coursesViewModel.state {
        case .loaded(let courses):
            return courses.filter { favourites.contains($0.id) }

        default:
            return []
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if courses.isEmpty {
                    ContentUnavailableView(
                        "No Favourites Yet",
                        systemImage: "heart"
                    )
                } else {
                    List(courses) { course in
                        coursesCardView(
                            course: course,
                            favouritesViewModel: favouritesViewModel
                        )
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                    .background(Color("AppBackground"))
                }
            }
            .background {
                Color("AppBackground")
                    .ignoresSafeArea()
            }
            .navigationTitle("Favourites")
            .toolbarBackground(
                Color("AppBackground"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    FavouritesScreen(
        coursesViewModel: CoursesViewModel(),
        favouritesViewModel: FavouritesViewModel()
    )
}
