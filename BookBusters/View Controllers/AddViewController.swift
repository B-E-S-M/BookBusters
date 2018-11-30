//
//  AddViewController.swift
//  BookBusters
//
//  Created by Shubham Gupta on 11/27/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

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
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
