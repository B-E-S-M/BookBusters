//
//  AddViewController.swift
//  BookBusters
//
//  Created by Shubham Gupta on 11/27/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let picker = UIImagePickerController()
 
    
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var subject: UITextField!
    
    @IBOutlet weak var sellerPhone: UITextField!
    
    @IBOutlet weak var sellerEmail: UITextField!
    @IBOutlet weak var conditionControl: UISegmentedControl!
    @IBOutlet weak var textDescription: UITextView!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceText.delegate = self
        picker.delegate = self
   
    }
    
    @IBAction func PickImage(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in
            
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.picker.sourceType = .camera
                self.present(self.picker, animated: true, completion: nil)
            } else
            {
                print("Camera not available")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(action:UIAlertAction) in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true, completion: nil)
        }))
        
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    // delegates
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        var  chosenImage = UIImage()
        chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage //2
        imageView.contentMode = .scaleAspectFill
        imageView.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postButton(_ sender: Any) {
        // Connect to database and add an textbook
        
        let textbookConditions = ["New", "Like New", "Used"]
        let testBookDictionary: [String: Any] = [
            "name" : titleText.text!,
            "subject" : subject.text!,
            "condition": textbookConditions[conditionControl.selectedSegmentIndex],
            "quantity" : 1,
            "price": priceText.text!,
            "description": textDescription.text!,
            "location": locationText.text!,
            "image_link": "https://i.imgur.com/rAoagIA.png",
            "seller_phone": sellerPhone.text!,
            "seller_email": sellerEmail.text!
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
