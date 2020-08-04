//
//  Bundle+ParsingJSON.swift
//  ParsingLocalJSON
//
//  Created by Cameron Rivera on 8/3/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

enum BundleError: Error {
    case invalidResource(String)
    case noContents(String)
    case decodingError(Error)
}

extension Bundle {
    
    // 1. Get the path of the file to be read using the bundle class => String?
    // 2. Using the path, read it's data contents => Data?
    
    // Bundle.main is a singleton
    // parsonJSON will be a throwing function.
    // To use throwing functions you have to use try! or do{} catch, or try?
    func parseJSON<T:Decodable>(with name: String) throws -> [T] {
        guard let path = Bundle.main.path(forResource: name, ofType: ".json") else { throw BundleError.invalidResource(name) }
        
        guard let data = FileManager.default.contents(atPath: path) else {
            throw BundleError.noContents(path)
        }
        
        var presidents: [T]
        
        do {
            presidents = try JSONDecoder().decode([T].self, from: data)
        } catch {
            throw BundleError.decodingError(error)
        }
        return presidents
    }
}
