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
        
            List(coursesViewModel.courses){ course in
                coursesCardView(course: course)
                
            }
            .navigationTitle("SkillUp Academy")
        }
    
}

#Preview {
    CoursesListView()
}
