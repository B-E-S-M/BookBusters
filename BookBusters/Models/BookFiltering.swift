//
//  BookFiltering.swift
//  BookBusters
//
//  Created by Brian Casipit on 11/29/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import Foundation

class BookFiltering {
    
    init() {} // initialize to use functions
    
    func filterBooks(books: [Book], searchString: String) -> [Book] {
        var filteredBooks: [Book] = []
        
        // Separate the searchString into words into an array
        let searchWords = searchString.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        
        for book in books {
            // Build the book string
            var bookString = book.name ?? "" + " "
            bookString.append(book.subject ?? "" + " ")
            bookString.append(book.condition ?? "" + " ")
            bookString.append(book.description ?? "")
            let loweredBookString = bookString.lowercased()
            
            // Set count of search words remaining.
            // Use this to check if all words were matched.
            var remainingWords = searchWords.count
            
            // If match all words in the string, append to filteredBooks
            for searchWord in searchWords {
                let lowerSearchWord = searchWord.lowercased()
                if loweredBookString.contains(lowerSearchWord) {
                    remainingWords -= remainingWords
                    if remainingWords <= 0 {
                        filteredBooks.append(book)
                        break
                    }
                }
            } // end string match loop
        }
        return filteredBooks
    }
    
}
