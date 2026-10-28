//
//  coursesCardView.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import SwiftUI

struct coursesCardView: View {
    let course: Course
    let favouritesViewModel: FavouritesViewModel

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(course.name)
                    .font(.body)
                    .fontWeight(.bold)

                Text(course.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(6)
            }

            Spacer(minLength: 8)

            FavoriteButton(
                courseID: course.id,
                favouritesViewModel: favouritesViewModel
            )
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.95, green: 0.93, blue: 0.89))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.black.opacity(0.15), lineWidth: 1)
        )
    }
}

#Preview {
    coursesCardView(
        course: Course(
            id: "44",
            name: "SwiftUI Fundamentals",
            description: "Learn to build native iOS apps using SwiftUI."
        ),
        favouritesViewModel: FavouritesViewModel()
    )
}
