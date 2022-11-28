//
//  Bundle+JSONParsing.swift
//  SwiftUIPlayground
//
//  Created by Alex Paul on 11/28/22.
//

import Foundation

extension Bundle {
    static func parse<T: Decodable>(_ resource: String, fileExtension: String) -> T {
        let teams: T
        guard let url = Bundle.main.url(forResource: resource, withExtension: fileExtension) else {
            fatalError("\(resource).\(fileExtension) not found")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("no contents")
        }
        do {
            teams = try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("error: \(error)")
        }
        return teams
    }
}
