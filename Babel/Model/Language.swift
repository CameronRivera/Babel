//
//  Language.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct LanguageWrapper: Decodable{
    let data: Hit
}

struct Hit: Decodable{
    let detections: [DetectedLanguage]
}

struct DetectedLanguage: Decodable, Equatable{
    let language: String
    let isReliable: Bool
    let confidence: Double
}
