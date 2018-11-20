//
//  Book.swift
//  BookBusters
//
//  Created by Brian Casipit on 11/19/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import Foundation

class Book {
    
    let post_id: Int?
    let name: String?
    let subject: String?
    let condition: String?
    
    let quantity: Int?
    let price: String?
    
    var description: String?
    let location: String?
    
    let image_link: String? // convert to URL type later if needed
    
    let seller_phone: String?
    let seller_email: String?
    
    init(dictionary: [String: Any]) {
        post_id = dictionary["post_id"] as? Int ?? -1
        name = dictionary["name"] as? String ?? "Name not available"
        subject = dictionary["subject"] as? String ?? "Subject not available"
        condition = dictionary["condition"] as? String ?? "Condition not available"
        
        quantity = dictionary["quantity"] as? Int ?? 1
        price = dictionary["price"] as? String ?? "Price not available"
        
        description = dictionary["description"] as? String ?? "No description"
        location = dictionary["location"] as? String ?? "Location not specified"
        
        image_link = dictionary["image_link"] as? String ?? ""
        
        seller_phone = dictionary["seller_phone"] as? String ?? "Phone number not specified"
        seller_email = dictionary["seller_email"] as? String ?? "Email not specified"
    }
    
    class func books(dictionaries: [[String: Any]]) -> [Book] {
        var books: [Book] = []
        for dictionary in dictionaries {
            let book = Book(dictionary: dictionary)
            books.append(book)
        }
        return books
    }
    
}
