//
//  coursesview.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import SwiftUI

struct CoursesListView: View {

    let coursesViewModel: CoursesViewModel
    let favouritesViewModel: FavouritesViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch coursesViewModel.state {

                case .idle:
                    ContentUnavailableView(
                        "No Courses Yet",
                        systemImage: "book"
                    )

                case .loading:
                    ProgressView("Loading Courses...")

                case .loaded(let courses):
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

                case .error(let error):
                    ContentUnavailableView {
                        Label(
                            "Unable to Load Courses",
                            systemImage: "exclamationmark.triangle"
                        )
                    } description: {
                        Text(error)
                    } actions: {
                        Button("Retry", systemImage: "arrow.clockwise") {
                            Task {
                                await coursesViewModel.fetch()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .background {
                Color("AppBackground")
                    .ignoresSafeArea()
            }
            .navigationTitle("SkillUp Academy")
            .toolbarBackground(
                Color("AppBackground"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    CoursesListView(
        coursesViewModel: CoursesViewModel(),
        favouritesViewModel: FavouritesViewModel()
    )
}
