//
//  PlacesController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import Foundation
import MapKit

class PlacesController {
    
    class var sharedInstance: PlacesController {
        struct Static {
            static var instance:PlacesController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token)    {
            Static.instance = PlacesController()
        }
        return Static.instance!
    }
    
    var placesArray = [Place]()
    
    func addPlace(title: String, coordinate: CLLocationCoordinate2D, image: String, describer: String, favorite: Bool, date: NSDate) {
        
        let newPlace = Place(title: title, coordinate: coordinate, date: date, describer: describer)
        newPlace.title = title
        newPlace.coordinate = coordinate
        newPlace.imageURL = image
        newPlace.describer = describer
        newPlace.favorite = favorite
        newPlace.date = NSDate()
        
        placesArray.append(newPlace)
        
        let loadedArray = PersistenceManager.loadNSArray("place.archive")
        
        print(loadedArray)
        
    }
    
    private func readPlacesFromMemory() {
        PersistenceManager.saveNSArray(placesArray, fileName: "place.archive")
    }
    
}