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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func starsTapped(sender: UIButton) {
        
    }
    
    
    
}
