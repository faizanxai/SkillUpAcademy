//
//  coursesCardView.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import SwiftUI

struct coursesCardView: View {
    let course : Course
    var body: some View {
        VStack(alignment: .leading){
                   Text(course.name)
                            .font(.body)
                            .fontWeight(.bold)
                            
                       
                        Text(course.description)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                           
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

        
    


#Preview {
    coursesCardView(course: Course(id: 44, name: "String", description: "d"))
}
