//
//  Place.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation
import MapKit

class Place: MKPointAnnotation {
    
//    var title: String?
//    var coordinate: CLLocationCoordinate2D
    var imageURL: String
    var descripthing: String?
    var favorite: Bool
    
    override init() {
//        self.title = ""
//        self.coordinate = CLLocationCoordinate2D(latitude: 30, longitude: 30)
        imageURL = ""
        favorite = false
    }
    
    class func placeList() -> [Place] {
        
        let place1 = Place()
        place1.title = "never@home"
        place1.coordinate = CLLocationCoordinate2D(latitude: -33.907861, longitude: 18.409094)
        place1.imageURL = "neverathome.jpg"
        place1.favorite = true
        
        let place2 = Place()
        place2.title = "Lion's Head"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.935021, longitude: 18.389108)
        place2.imageURL = "LionsHead.jpg"
        place2.favorite = true
        
        let place3 = Place()
        place3.title = "somewhere else"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.907500 , longitude: 18.409500)
        place3.imageURL = "LCHouse.jpeg"
        
        let place4 = Place()
        place4.title = "Truth Coffee"
        place4.coordinate = CLLocationCoordinate2D(latitude: -33.917536, longitude: 18.419633)
        place4.imageURL = "truthcoffee.jpg"
        place4.favorite = true
        
        let place5 = Place()
        place5.title = "Fork"
        place5.coordinate = CLLocationCoordinate2D(latitude: -33.922234, longitude: 18.419240)
        place5.imageURL = "fork.jpg"
        place5.favorite = true
        
        let place6 = Place()
        place6.title = "Workshop 17"
        place6.coordinate = CLLocationCoordinate2D(latitude: -33.907095, longitude: 18.418631)
        place6.imageURL = "workshop17.jpg"
        
        let place7 = Place()
        place7.title = "Old Biscuit Mill"
        place7.coordinate = CLLocationCoordinate2D(latitude: -33.927540, longitude: 18.457579)
        place7.imageURL = "oldbiscuitmill.jpg"
        place7.favorite = true
        
        let place8 = Place()
        place8.title = "Cape Town Stadium"
        place8.coordinate = CLLocationCoordinate2D(latitude: -33.903578, longitude: 18.411107)
        place8.imageURL = "capetownstadium.jpg"
        
        let place9 = Place()
        place9.title = "UCT"
        place9.coordinate = CLLocationCoordinate2D(latitude: -33.957715, longitude: 18.461218)
        place9.imageURL = "uct.jpg"
        
        let place10 = Place()
        place10.title = "Beerhouse"
        place10.coordinate = CLLocationCoordinate2D(latitude: -33.925448, longitude: 18.415969)
        place10.imageURL = "beerhouse.jpg"
        
        return [place1, place2, place3, place4, place5, place6, place7, place8, place9, place10]
    }
}

extension UIImageView   {
    
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}