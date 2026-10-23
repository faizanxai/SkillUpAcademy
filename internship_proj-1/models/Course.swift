//
//  Course.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 20/10/2026.
//

import Foundation

struct Course : Codable, Identifiable, Equatable{
    let id : String
    let name : String
    let description : String
}

struct CourseraResponse: Codable {
    let elements: [Course]
}
