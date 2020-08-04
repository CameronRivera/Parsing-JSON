//
//  APIClient.swift
//  ParsingJSON-Using-URLSession
//
//  Created by Cameron Rivera on 8/4/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL(String)
    case networkClientError(Error)
    case noResponse
    case badStatusCode(Int)
    case noData
    case decodingError(Error)
}

// TODO: Convert to a Generic APIClient<Station>()
// Conform API Client to Decodable

class APIClient {
    
    // The fetchData() method does an asynchronous network call. This means the method returns (BEFORE) the request is complete
    
    // When dealing with asynchronous calls we use a closure.
    // Other mechanisms you can use include:  delegation, NotificationCenter, and newer to iOS developers as of iOS 13 is combine.
    
    // Closures are reference types that capture values.
    
    func fetchData(_ completion: @escaping (Result<[Station],AppError>) -> ()) {
        let endpoint = "https://gbfs.citibikenyc.com/gbfs/en/station_information.json"
        
        // "prospect park".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) // Replaces " " with %20
        
        // 1.
        // We need a URL to create our Network Request
        guard let url = URL(string: endpoint) else { completion(.failure(.badURL(endpoint)))
            return
        }
        
        // 2. Create a GET request, other request examples POST, DELETE, PATCH, PUT
        let request = URLRequest(url: url)
        
        //request.httpMethod = "GET"
        //request.httpBody = data
        //requst.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 3. user URLSession to make a Network Request
        // URLSession.shared is a singleton
        // this is sufficient to use for making most requests
        // using URLSession without the shared instance gives you access
        // to adding necessary configurations to your task
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            switch httpResponse.statusCode{
            case 200...299:
                break
            default:
                completion(.failure(.badStatusCode(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            // 4. Decode the JSON to our Swift Model
            do {
                let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                completion(.success(results.data.stations))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        dataTask.resume()
    }
    
}
