//
//  LanguageAPI.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import Foundation

struct LanguageAPI{
    
    static let displayText = "Will I go to heaven?"
    
    static func getLanguages(_ urlString: String, completion: @escaping (Result<[DetectedLanguage],NetworkError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(request) { result in
            switch result{
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do{
                    let wrapper = try JSONDecoder().decode(LanguageWrapper.self, from: data)
                    completion(.success(wrapper.data.detections))
                } catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func getAllLanguages(completion: @escaping (Result<[AllLanguage],NetworkError>) -> ()){
        
        guard let url = URL(string: "https://ws.detectlanguage.com/0.2/languages") else {
            completion(.failure(.badURL("https://ws.detectlanguage.com/0.2/languages")))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(request) { result in
            switch result{
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do{
                    let allLanguages = try JSONDecoder().decode([AllLanguage].self, from: data)
                    completion(.success(allLanguages))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func translateText(_ urlString: String, completion: @escaping (Result<String,NetworkError>) -> ()) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(request) { result in
            switch result{
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do{
                    let translatedText = try JSONDecoder().decode(TranslatedText.self, from: data)
                    if let transText = translatedText.text.first {
                        completion(.success(transText))
                    }
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func populateLanguageArray(_ langArr: [DetectedLanguage], _ allLangArr: [AllLanguage]) -> [DetectedLanguage]{
        guard !langArr.isEmpty else {
            return langArr
        }
        var tempArr = langArr
        if tempArr.count < 4{
            while tempArr.count < 4 {
                let addLanguage = DetectedLanguage(language: allLangArr[Int.random(in: 0..<allLangArr.count)].code, isReliable: true, confidence: Double.random(in: 0...20))
                if !tempArr.contains(addLanguage){
                    tempArr.append(addLanguage)
                }
            }
        }
        return tempArr.shuffled()
    }
    
    static func setQueryString(_ query: String) -> String{
        guard let searchQuery = "\(query)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        
        return "https://ws.detectlanguage.com/0.2/detect?q=\(searchQuery)&key=\(SecretKeys.detectionAPIKey)"
    }
    
    static func setTranslationQuery (_ query: String, _ targetCode: String) -> String{
        guard let searchQuery = "\(query)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }

        return "https://translate.yandex.net/api/v1.5/tr.json/translate?key=\(SecretKeys.translateAPIKey)&text=\(searchQuery)&lang=en-\(targetCode)"
    }
}
