//
//  CustomTableViewCell.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/13/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(place: Place, date: String) {
        let placeTitle = place.title
        cellTitle.text = placeTitle
        
        cellDate.text = date
        
        let placeImage = place.imageURL
        cellImage.image = UIImage(named: placeImage)
        
    }
    
}
