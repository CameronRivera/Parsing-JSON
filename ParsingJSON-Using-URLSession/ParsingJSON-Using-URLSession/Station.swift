//
//  Station.swift
//  ParsingJSON-Using-URLSession
//
//  Created by Cameron Rivera on 8/4/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

// Review Float vs. Double, a double holds more floating point values than a float.

// Top Level
struct ResultsWrapper: Decodable {
    let data: StationsWrapper
}

struct StationsWrapper: Decodable {
    let stations: [Station]
}

struct Station: Decodable, Hashable {
    let latitude: Double
    let longitude: Double
    let stationType: String
    let capacity: Int
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
        case stationType = "station_type"
        case capacity = "capacity"
        case name = "name"
    }
}
