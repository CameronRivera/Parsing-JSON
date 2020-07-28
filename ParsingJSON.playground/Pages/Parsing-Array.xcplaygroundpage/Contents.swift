// Parsing Array

import Foundation

let json = """
[
    {
        "title": "New York",
        "location_type": "City",
        "woeid": 2459115,
        "latt_long": "40.71455,-74.007118"
    }
]
""".data(using: .utf8)!
//=========================================================
// Create Model
//=========================================================
struct City: Decodable {
    let title: String
    let locationType: String
    let woeid: Int
    let coordinate: String
    
    // Reminder, once property names are changed using CodingKeys, they must match
    // identically to the case type.
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case locationType = "location_type"
        case woeid = "woeid"
        case coordinate = "latt_long"
    }
}

//=========================================================
// decode JSON to Swift Objects
//=========================================================

do {
    let cities = try JSONDecoder().decode([City].self, from: json)
    dump(cities)
} catch {
    print("Decoding Error: \(error.localizedDescription)")
}

/*
 ▿ 1 element
 ▿ __lldb_expr_3.City
   - title: "New York"
   - locationType: "City"
   - woeid: 2459115
   - coordinate: "40.71455,-74.007118"
 */
