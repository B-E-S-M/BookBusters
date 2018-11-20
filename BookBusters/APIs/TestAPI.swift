//
//  TestAPI.swift
//  BookBusters
//
//  Created by Brian Casipit on 11/19/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import Foundation

class TestAPI {
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func fetchTestBooks(completion: @escaping ([Book]?, Error?) -> ()) {
        let urlString = "https://raw.githubusercontent.com/B-E-S-M/BookBusters/add-model-and-dummy-info/BookSample.json"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String: Any]]
                
                let books = Book.books(dictionaries: dataDictionary)
                
                completion(books, nil)
            } else {
                completion(nil, error)
                print("Error serializing json: ", error!)
            }
        }
        task.resume()
    }
    
}
