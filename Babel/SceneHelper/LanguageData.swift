//
//  SceneData.swift
//  Babel
//
//  Created by Cameron Rivera on 1/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation
import SpriteKit

class LanguageData{
    static let shared = LanguageData()
    var allLanguages = [AllLanguage]()
    var properTranslation = false
    var correctChoice: DetectedLanguage?
    var languageData =  [DetectedLanguage]()
    var queryString = String() {
        didSet{
            // Detect the Language
            LanguageAPI.getLanguages(LanguageAPI.setQueryString(queryString)) { [weak self] result in
                switch result{
                case .failure:
                    break
                case .success(let langs):
                    
                    if let first = langs.first{
                        self?.correctChoice = first
                    }
                    
                    if let all = self?.allLanguages{
                        self?.languageData = LanguageAPI.populateLanguageArray(langs, all)
                    }
                }
            }
        }
    }
    
    private init(){
        loadLanguages()
        sleep(3)
        setUp()
    }
    
    private func loadLanguages(){
        // Loads a list of all of the language codes and languages that can be detected.
        LanguageAPI.getAllLanguages { [weak self] result in
            switch result{
            case .failure:
                break
            case .success(let all):
                self?.allLanguages = all
            }
        }
    }
    
    private func setUp(){
        while !properTranslation{
            var langCode = allLanguages[Int.random(in: 0..<allLanguages.count)].code
            
            while langCode == "en"{
                langCode = allLanguages[Int.random(in: 0..<allLanguages.count)].code
            }
            // Translate Text
            LanguageAPI.translateText(LanguageAPI.setTranslationQuery(LanguageAPI.displayText, langCode)) { [weak self] result in
                switch result{
                case .failure:
                    break
                case .success(let translatedText):
                    self?.properTranslation = true
                    self?.queryString = translatedText
                }
            }
            sleep(3)
        }
        properTranslation = false
    }
    
    func newQuery() {
        setUp()
    }
    
    func checkChoice(_ userChoice: DetectedLanguage) -> Bool{
        guard let correct = correctChoice else {
            return false
        }
        if userChoice == correct{
            return true
        } else {
            return false
        }
    }
}
