// Parsing Dictionary

import Foundation

// JSON Data
let json = """
{
 "results": [
   {
     "firstName": "John",
     "lastName": "Appleseed"
   },
  {
    "firstName": "Alex",
    "lastName": "Paul"
  }
 ]
}
""".data(using: .utf8)! // Turns this json into data.
//=======================================================
// Create Model(s)
//=======================================================

// Coadable: An alias for Coadable & Decodable
// Decodable: Converts json data into Swift types.
// Encodable: Changes swift data types into JSON data.

// Top Level JSON is a Dictionary
struct ResultsWrapper: Decodable {
    let results: [Contact]
}

struct Contact: Decodable {
    let firstName: String
    let lastName: String
}

//=======================================================
// Decode the JSON data to our Swift Model
//=======================================================

do {
    let dictionary = try JSONDecoder().decode(ResultsWrapper.self, from: json)
    let contacts = dictionary.results // [Contact]
    dump(contacts)
} catch {
    print("Decoding Error: \(error.localizedDescription)")
}

/*
 ▿ 2 elements
 ▿ __lldb_expr_1.Contact
   - firstName: "John"
   - lastName: "Appleseed"
 ▿ __lldb_expr_1.Contact
   - firstName: "Alex"
   - lastName: "Paul"
 */
