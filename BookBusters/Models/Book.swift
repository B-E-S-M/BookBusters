//
//  Book.swift
//  BookBusters
//
//  Created by Brian Casipit on 11/19/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import Foundation

class Book {
    
    let id: Int?
    let name: String?
    let subject: String?
    let condition: String?
    
    let quantity: Int?
    let price: String?
    
    var description: String?
    let location: String?
    
    let image_link: String? // convert to URL type later if needed
    let image_link2: String? // convert to URL type later if needed
    let image_link3: String? // convert to URL type later if needed
    
    let seller_phone: String?
    let seller_email: String?
    
    let created_at: String?
    let updated_at: String?
    
    init(dictionary: [String: Any]) {
        id = dictionary["id"] as? Int ?? -1
        name = dictionary["name"] as? String ?? "Name not available"
        subject = dictionary["subject"] as? String ?? "Subject not available"
        condition = dictionary["condition"] as? String ?? "Condition not available"
        
        quantity = dictionary["quantity"] as? Int ?? 1
        price = dictionary["price"] as? String ?? "Price not available"
        
        description = dictionary["description"] as? String ?? "No description"
        location = dictionary["location"] as? String ?? "Location not specified"
        
        image_link = dictionary["image_link"] as? String ?? ""
        image_link2 = dictionary["image_link2"] as? String ?? ""
        image_link3 = dictionary["image_link3"] as? String ?? ""
        
        seller_phone = dictionary["seller_phone"] as? String ?? "Phone number not specified"
        seller_email = dictionary["seller_email"] as? String ?? "Email not specified"
        
        // Format date string
        let createdAtOriginalString = dictionary["created_at"] as! String
        let updatedAtOriginalString = dictionary["updated_at"] as! String
        let formatter = DateFormatter()
        // Configure the input format to parse the date string
        formatter.dateFormat = "E MMM d HH:mm:ss Z y"
        // Convert String to Date
        let creationDate = formatter.date(from: createdAtOriginalString)!
        let updateDate = formatter.date(from: updatedAtOriginalString)!
        // Configure output format
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        // Convert Date to String and set
        created_at = formatter.string(from: creationDate)
        updated_at = formatter.string(from: updateDate)
    }
    
    class func books(dictionaries: [[String: Any]]) -> [Book] {
        var books: [Book] = []
        for dictionary in dictionaries {
            let book = Book(dictionary: dictionary)
            books.append(book)
        }
        return books
    }
    
    func printProperties() {
        print("Name: \(name ?? "Name not available")")
        print("Subject: \(subject ?? "Subject not available")")
        print("Condition: \(condition ?? "Condition not available")")
        
        print("Quantity: \(quantity ?? 1)")
        print("Price: \(price ?? "Price not available")")
        
        print("Description: \(description ?? "No description")")
        print("Location: \(location ?? "Location not specified")")
        
        print("Image Link: \(image_link ?? "")")
        print("Image Link 2: \(image_link2 ?? "")")
        print("Image Link 3: \(image_link3 ?? "")")
        
        print("Seller Phone: \(seller_phone ?? "Phone number not specified")")
        print("Seller Email: \(seller_email ?? "Email not specified")")
        
        print("Created at: \(created_at ?? "Creation time not available")")
        print("Updated at: \(updated_at ?? "Update time not available")")
    }
    
}
