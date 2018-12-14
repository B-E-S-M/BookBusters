//
//  DetailsViewController.swift
//  BookBusters
//
//  Created by Monali Chuatico on 11/30/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var sellerImage: UIImageView!
    @IBOutlet weak var sellerName: UILabel!
    @IBOutlet weak var sellerContact: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
    navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
