//
//  CustomTableViewCell.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/13/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    @IBOutlet weak var cellImage: UIImageView!
//    @IBOutlet weak var cellTitle: UILabel!
//    @IBOutlet weak var cellDate: UILabel!
    
    var favoriteStar:UIImageView = UIImageView(frame: CGRectMake(75, 75, 10, 10))
    var cellImage:UIImageView = UIImageView(frame: CGRectMake(0, 0, 88, 88))
    var cellTitle:UILabel = UILabel(frame: CGRectMake(100, 7, 200, 30))
    var cellDate:UILabel = UILabel(frame: CGRectMake(100, 50, 200, 30))
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "CustomTableViewCell")
        
        self.addSubview(cellTitle)
        self.addSubview(cellImage)
        self.addSubview(cellDate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

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
