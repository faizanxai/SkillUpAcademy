//
//  defaultCourseFetcher.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 23/10/2026.
//

import Foundation

struct defaultCourseFetcher : courseFetchService {
    func fetchCourses() async throws -> [Course] {
        guard let url = URL(string: "https://api.coursera.org/api/courses.v1?fields=name,description&limit=20&utm_source=chatgpt.com") else {
            throw APIError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse
            }
            let decodedResponse = try JSONDecoder().decode(CourseraResponse.self, from : data)
            return decodedResponse.elements
//            return try JSONDecoder().decode([Course].self, from: data)

        } catch let error as DecodingError {
            throw APIError.decoding(error)
        } catch let error as URLError {
            throw APIError.networkError(error)
        }
    }
    
    
    
}
