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
    var imageURL: String
    
    override init() {
        title = ""
        coordinate = CLLocationCoordinate2D(latitude: 30, longitude: 30)
        imageURL = ""
    }
    
    class func placeList() -> [Place] {
        
        let place1 = Place()
        place1.title = "never@home"
        place1.coordinate = CLLocationCoordinate2D(latitude: -33.907861, longitude: 18.409094)
        place1.imageURL = "neverathome.jpg"
        
        let place2 = Place()
        place2.title = "Lion's Head"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.935021, longitude: 18.389108)
        place2.imageURL = "LionsHead.jpg"
        
        return [place1, place2]
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