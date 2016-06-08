//
//  Place.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var imageURL: String?
    
    override init() {
        coordinate = CLLocationCoordinate2D(latitude: 30, longitude: 30)
    }
    
    class func placeList() -> [Place] {
        
        let place1 = Place()
        place1.title = "never@home"
        place1.coordinate = CLLocationCoordinate2D(latitude: -33.907861, longitude: 18.409094)
        place1.imageURL = "neverathome"
        
        let place2 = Place()
        place2.title = "Lion's Head"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.935021, longitude: 18.389108)
        place2.imageURL = "LionsHead"
        
        return [place1, place2]
    }
}
