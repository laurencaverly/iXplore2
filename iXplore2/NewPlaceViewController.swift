//
//  NewPlaceViewController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/14/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit
import MapKit

class NewPlaceViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTapped(sender: UIButton) {
        
        let newTitle = titleTextField.text
        
        let newLatitude = Double(latitudeTextField.text!)!
        print(newLatitude)
        let longitude = Double(longitudeTextField.text!)!
        print(longitude)
        let newCoordinate = CLLocationCoordinate2D(latitude: newLatitude, longitude: longitude)
        
        print(newCoordinate)
        let newDescription = descriptionTextField.text
        
        PlacesController.sharedInstance.addPlace(newTitle!, coordinate: newCoordinate, image: "", describer: newDescription!, favorite: false, date: NSDate())
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
