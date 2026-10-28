//
//  ContentView.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//


import SwiftUI

struct ContentView: View {
    @State private var coursesViewModel = CoursesViewModel()
    @State private var favouritesViewModel = FavouritesViewModel()

    var body: some View {
        TabView {
            Tab("All", systemImage: "house") {
                CoursesListView(
                    coursesViewModel: coursesViewModel,
                    favouritesViewModel: favouritesViewModel
                )
            }

            Tab("Favourites", systemImage: "heart") {
                FavouritesScreen(
                    coursesViewModel: coursesViewModel,
                    favouritesViewModel: favouritesViewModel
                )
            }
        }.background{
            Color("AppBackground")
                .ignoresSafeArea()
        }
        .task {
            favouritesViewModel.load()
            await coursesViewModel.fetch()
        }
    }
}

#Preview {
    ContentView()
}
