//
//  CourseCache.swift
//  internship_proj-1
//
//  Created by Faizan Nabi on 02/11/2026.
//

import Foundation

enum CourseCache {

    private static var fileURL: URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("cachedCourses.json")
    }

    static func save(_ courses: [Course]) {
        do {
            let data = try JSONEncoder().encode(courses)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Failed to save cache: \(error)")
        }
    }

    static func load() -> [Course]? {
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return try? JSONDecoder().decode([Course].self, from: data)
    }
}
