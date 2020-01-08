//
//  NetworkError.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL(String)
    case noResponse
    case badData
    case networkClientError(Error)
    case decodingError(Error)
    case encodingError(Error)
    case badStatusCode(Int)
}
