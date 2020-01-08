//
//  ViewController.swift
//  Babel
//
//  Created by Cameron Rivera on 12/30/19.
//  Copyright © 2019 Cameron Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var lowerTextView: UITextView!
    //private var refreshController: UIRefreshControl!
    
    var properTranslation = false
    var correctChoice: DetectedLanguage?
    var languageData =  [DetectedLanguage](){
        didSet{
            DispatchQueue.main.async{
                self.tableView.reloadData()
                //self.refreshController.endRefreshing()
                self.textView.text = "If I had to guess, I would say this soul is speaking...."
            }
        }
    }
    
    var queryString = ""{
        didSet{
            // Detect the Language
            LanguageAPI.getLanguages(LanguageAPI.setQueryString(queryString)) { [weak self] result in
                switch result{
                case .failure(let netError):
                    DispatchQueue.main.async{
                        self?.showAlert("Language Detection Error", "Encountered error when attempting to load detected language: \(netError)")
                    }
                case .success(let langs):
                    
                    if let first = langs.first{
                        self?.correctChoice = first
                        print(first)
                    }
                    
                    if let all = self?.allLanguages{
                        self?.languageData = LanguageAPI.populateLanguageArray(langs, all)
                    }
                }
            }
        }
    }
    
    var allLanguages = [AllLanguage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLanguages()
        sleep(3)
        setUp()
        // configureRefreshControl()
    }
    
    @objc
    private func setUp(){
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        // Check that the language is not English.
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
                    DispatchQueue.main.async{
                        self?.lowerTextView.text = translatedText
                        self?.queryString = self?.lowerTextView.text ?? ""
                    }
                }
            }
            sleep(3)
        }
        properTranslation = false
    }
    
//    @IBAction func reload(_ sender: UIBarButtonItem){
//        setUp()
//    }
    
    private func loadLanguages(){
        // Loads a list of all of the language codes and languages that can be detected.
        LanguageAPI.getAllLanguages { [weak self] result in
            switch result{
            case .failure(let netError):
                DispatchQueue.main.async{
                    self?.showAlert("All Languages Error", "Encountered error when attempting to load all languages: \(netError)")
                }
            case .success(let all):
                self?.allLanguages = all
            }
        }
    }
    
//    private func configureRefreshControl(){
//        refreshController = UIRefreshControl()
//        tableView.refreshControl = refreshController
//        refreshController.addTarget(self, action: #selector(setUp), for: .valueChanged)
//    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let xCell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        let curLangs = allLanguages.filter{languageData[indexPath.row].language == $0.code}
        if let curl = curLangs.first{
            xCell.textLabel?.text = curl.name.lowercased()
        }
        xCell.detailTextLabel?.text = "Confidence Level: \(String(format: "%.2f", languageData[indexPath.row].confidence))"
        return xCell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if correctChoice == languageData[indexPath.row] {
            view.backgroundColor = .green
        } else{
            view.backgroundColor = .red
        }
    }
}


