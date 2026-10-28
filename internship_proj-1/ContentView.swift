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
            CoursesListView(
                coursesViewModel: coursesViewModel,
                favouritesViewModel: favouritesViewModel
            )
            .tabItem {
                Label("All", systemImage: "house")
            }

            FavouritesScreen(
                coursesViewModel: coursesViewModel,
                favouritesViewModel: favouritesViewModel
            )
            .tabItem {
                Label("Favourites", systemImage: "heart")
            }
        }
        .background {
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
