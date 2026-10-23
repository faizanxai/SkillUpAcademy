//
//  coursesview.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import SwiftUI

struct CoursesListView: View {
    @State private var coursesViewModel = CoursesViewModel()

    var body: some View {
        NavigationStack {
            switch coursesViewModel.state {
            case .idle:
                Text("No Courses yet")
            case .loading:
                ProgressView("Loading ...")
            case .loaded(let courses):
                List(courses) { course in
                    coursesCardView(course: course)
                }
                .navigationTitle("SkillUp Academy")
            case .error(let error):
                Text(error).foregroundStyle(.pink)
                Button("Retry", systemImage: "arrow.clockwise") {
                    Task { await coursesViewModel.fetch() }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .task { await coursesViewModel.fetch() }
    }
}

#Preview {
    CoursesListView()
}
