//
//  President.swift
//  ParsingLocalJSON
//
//  Created by Cameron Rivera on 8/3/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

// president.president
struct President: Decodable, Hashable {
    let number: Int
    let name: String // originally called "president"
    let birthYear: Int
    let deathYear: Int?
    let tookOffice: String
    let leftOffice: String?
    let party: String
    
    private enum CodingKeys: String, CodingKey {
        case number = "number"
        case name = "president"
        case birthYear = "birth_year"
        case deathYear = "death_year"
        case tookOffice = "took_office"
        case leftOffice = "left_office"
        case party = "party"
    }
}
