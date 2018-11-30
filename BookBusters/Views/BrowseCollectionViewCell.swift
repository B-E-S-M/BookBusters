//
//  BrowseCollectionViewCell.swift
//  BookBusters
//
//  Created by Shubham Gupta on 11/29/18.
//  Copyright © 2018 B-E-S-M. All rights reserved.
//

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var book: Book? {
        didSet {
            self.updateUI()
        }
    }
    
    private func updateUI(){
        if let book = book{
            bookImageView.image = nil
            priceLabel.text = book.price
            subjectLabel.text = book.subject
            conditionLabel.text = book.condition
            locationLabel.text = book.location
            
        }
        else {
            bookImageView.image = nil
            priceLabel.text = nil
            subjectLabel.text = nil
            conditionLabel.text = nil
            locationLabel.text = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 2.0
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 5, height: 10)
        self.clipsToBounds = false
    }
}
