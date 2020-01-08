//
//  NetworkHelper.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

class NetworkHelper{
    
    static let shared = NetworkHelper()
    private var session = URLSession(configuration: .default)
    
    private init() {
        
    }
    
    func performDataTask(_ request: URLRequest, completion: @escaping (Result<Data,NetworkError>) -> ()) {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(.failure(.networkClientError(error)))
                return
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
            }
            
            guard let data = data else{
                completion(.failure(.badData))
                return
            }
            
            completion(.success(data))
            
        }
        dataTask.resume()
    }
}
