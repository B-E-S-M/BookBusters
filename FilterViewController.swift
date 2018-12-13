//
//  FilterViewController.swift
//  BookBusters
//
//  Created by Shubham Gupta on 12/13/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    

    
    @IBOutlet var ConditionFilter: UITextField!
    @IBOutlet var SubjectFilter: UITextField!
    
    var currentTextField = UITextField()
    var pickerView = UIPickerView()
   

    var Conditions: [String] = []
    var Subjects: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Subjects = ["", "Math","English", "History", "Chemistry", "Computer Science", "IOS", "Japanese", "Physics", "Sociology", "Spanish"]
        Conditions = ["", "New", "Like New", "Used"]
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: UIPickerView Delegation
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if currentTextField == SubjectFilter{
            return Subjects.count
        } else if currentTextField == ConditionFilter {
            return Conditions.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if currentTextField == SubjectFilter{
            return Subjects[row]
        } else if currentTextField == ConditionFilter {
            return Conditions[row]
        } else {
            
        return ""
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTextField == SubjectFilter{
             SubjectFilter.text = Subjects[row]
            self.view.endEditing(true)
        } else if currentTextField == ConditionFilter {
            ConditionFilter.text = Conditions[row]
            self.view.endEditing(true)
        }
    }
       
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTextField = textField
        if currentTextField == SubjectFilter{
           currentTextField.inputView = pickerView
        } else if currentTextField == ConditionFilter {
            currentTextField.inputView = pickerView
    }
    }
    
  
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
