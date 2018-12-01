//
//  AddViewController.swift
//  BookBusters
//
//  Created by Shubham Gupta on 11/27/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBAction func takePhotoButton(_ sender: Any) {
        // Connect to the camera api
    }
    
    
    @IBAction func selectPhotoButton(_ sender: Any) {
        // Access to the Camera Roll and select a photo
    }
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var conditionControl: UISegmentedControl!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    @IBAction func postButton(_ sender: Any) {
        // Connect to database and add an textbook
        
        let textbookConditions = ["New", "Like New", "Used"]
        let testBookDictionary: [String: Any] = [
            "name" : titleText.text!,
            "subject" : "English",
            "condition": textbookConditions[conditionControl.selectedSegmentIndex],
            "quantity" : 1,
            "price": priceText.text!,
            "description": textDescription.text!,
            "location": locationText.text!,
            "image_link": "https://i.imgur.com/rAoagIA.png",
            "seller_phone": "916-555-0101",
            "seller_email": "coolestperson@yourmail.com"
        ]
        
        // the argument, book, represents a new Book
        // using it is optional, but it is available if needed
        BookBustersAPI().postBook(bookDictionary: testBookDictionary) { (book: Book?, error: Error?) in
            // guard if there's an error with the book
            if let book = book {
                // if successful, notify in console
                print("Post was successful!\n")
                print("NEW BOOK")
                print("--------")
                book.printProperties()
            }
            else {
                // if error, printer error in console
                print("Error: \(error ?? " " as! Error)")
            }
        } // end of
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceText.delegate = self
        // Do any additional setup after loading the view.
    }
    
    // Input Number Validation for price & maybe phone number
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "+1234567890."
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
