//
//  BookBustersAPI.swift
//  BookBusters
//
//  Created by Brian Casipit on 11/25/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import Foundation

class BookBustersAPI {
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func fetchBooks(completion: @escaping ([Book]?, Error?) -> ()) {
        let urlString = "https://dry-castle-38032.herokuapp.com/books"
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let response = response { print(response) }
            
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
    
    func postBook(bookDictionary: [String: Any], completion: @escaping (Book?, Error?) -> ()) {
        let urlString = "https://dry-castle-38032.herokuapp.com/book_create_using_json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: bookDictionary, options: []) else { return }
        request.httpBody = httpBody
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let response = response { print(response) }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: httpBody, options: [])
                    print("\nJSON")
                    print("----")
                    print(json)
                    print()
                    
                    let newBook = Book.init(dictionary: bookDictionary)
                    completion(newBook, nil)
                } catch {
                    completion(nil, error)
                    print("Error serializing json: ", error)
                }
            }
            
        }
        task.resume()
    }
    
}
