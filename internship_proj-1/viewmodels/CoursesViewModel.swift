//
//  coursesviewmodel.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import Foundation
import Observation


enum APIError : LocalizedError{
    case invalidURL
    case invalidResponse
    case decoding(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self{
        case .invalidURL:
            return "The URL is invalid"
        case .invalidResponse:
            return "The Response is invalid from server"
        case .decoding(let error):
            return "Failed to decode response: \(error.localizedDescription) "
        case .networkError(let error):
            return   "Network Error : \(error.localizedDescription)"
            
        }
    }
}




@Observable
class CoursesViewModel {
    
    
    enum State : Equatable{
        case idle
        case loading
        case loaded([Course])
        case error(String)
        
        
    }
    var state : State = .idle
    var courses : [Course] = []
    private let service : courseFetchService
    init( service: courseFetchService = defaultCourseFetcher()) {
        self.service = service
    }
    
    func fetch () async {
        
        guard state == .idle else {return}
        state = .loading
        do {
            let courses = try await service.fetchCourses()
            self.state = .loaded(courses)
        }catch let error as APIError{
            self.state = .error(error.errorDescription ?? "Unknown error")
        }catch{
            self.state = .error("unknown error")
        }
        
        
        
        
        
    }
}
//
//Course(
//    id: 1,
//    name: "SwiftUI Fundamentals",
//    description: "Learn to build native iOS apps using SwiftUI, including views, layouts, state management, and navigation."
//),
//Course(
//    id: 2,
//    name: "Python Programming",
//    description: "Master Python basics, including variables, loops, functions, data structures, and object-oriented programming."
//),
//Course(
//    id: 3,
//    name: "Data Science Essentials",
//    description: "Explore data analysis using Python, Pandas, NumPy, and Matplotlib to clean data and create visualizations."
//),
//Course(
//    id: 4,
//    name: "Cybersecurity Fundamentals",
//    description: "Understand network security, common cyber threats, encryption, and essential techniques for protecting systems."
//),
//Course(
//    id: 5,
//    name: "SQL and Database Design",
//    description: "Learn to design relational databases and write SQL queries to retrieve, filter, join, and manage data."
//)
