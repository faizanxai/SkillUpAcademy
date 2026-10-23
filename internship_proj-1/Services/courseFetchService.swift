//
//  courseFetcher.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 23/10/2026.
//

import Foundation

protocol courseFetchService{
    func fetchCourses() async throws -> [Course]
        
}
