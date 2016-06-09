//
//  tableViewCell.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(place: Place) {
        let placeTitle = place.title
        cellLabel.text = placeTitle
        
        let placeImage = place.imageURL
        cellImage.image = UIImage(named: placeImage)
        
    }
    
    @IBAction func starsTapped(sender: UIButton) {
        
        let tag = sender.tag
        
        if tag == 0 {
            
        }
        
    }
    
    func setLabelText(text: String) {
        cellLabel.text = text
    }
    
    
}





