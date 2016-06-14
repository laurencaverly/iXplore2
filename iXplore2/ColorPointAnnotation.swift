//
//  ColorPointAnnotation.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class ColorPointAnnotation: MKPointAnnotation {
    
    var pinColor: UIColor
    var imageURL: String?
    var descripthing: String?
    var favorite: Bool?
    
    init(pinColor: UIColor) {
        self.pinColor = pinColor
        super.init()
        title = ""
        coordinate = CLLocationCoordinate2D(latitude: -33.905289, longitude: 18.430412)
    }
}