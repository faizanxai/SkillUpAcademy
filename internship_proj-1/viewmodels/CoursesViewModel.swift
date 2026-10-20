//
//  coursesviewmodel.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import Foundation
import Observation

@Observable
class CoursesViewModel {
    
    var courses : [Course] = [
        
       
            Course(
                id: 1,
                name: "SwiftUI Fundamentals",
                description: "Learn to build native iOS apps using SwiftUI, including views, layouts, state management, and navigation."
            ),
            Course(
                id: 2,
                name: "Python Programming",
                description: "Master Python basics, including variables, loops, functions, data structures, and object-oriented programming."
            ),
            Course(
                id: 3,
                name: "Data Science Essentials",
                description: "Explore data analysis using Python, Pandas, NumPy, and Matplotlib to clean data and create visualizations."
            ),
            Course(
                id: 4,
                name: "Cybersecurity Fundamentals",
                description: "Understand network security, common cyber threats, encryption, and essential techniques for protecting systems."
            ),
            Course(
                id: 5,
                name: "SQL and Database Design",
                description: "Learn to design relational databases and write SQL queries to retrieve, filter, join, and manage data."
            )
        ]
    
    
    
    
    
    
}
