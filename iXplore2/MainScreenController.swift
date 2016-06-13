//
//  ViewController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit
import MapKit

class MainScreenController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var deletePlaceIndexPath: NSIndexPath? = nil
    
    var placeList = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        self.mapViewSetup()
        self.tableViewSetup()
        
        
        placeList = Place.placeList()
        print(placeList[0])
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func mapViewSetup() {
        
        self.mapView.mapType = .HybridFlyover
        self.mapView.showsPointsOfInterest = true
        self.mapView.addAnnotations(placeList)
    }
    
    
    
    func tableViewSetup () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.registerNib(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
    
    
    
    //Table View Setup
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let place = placeList[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell", forIndexPath: indexPath) as! CustomTableViewCell
       
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        
        let convertedDate = dateFormatter.stringFromDate(date)
        
        cell.setupCell(place, date: convertedDate)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 88
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Places"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let span = MKCoordinateSpanMake(0.075, 0.075)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: placeList[indexPath.row].coordinate.latitude, longitude : placeList[indexPath.row].coordinate.longitude) , span: span)
        mapView.setRegion(region, animated: true)
        
        self.mapView.showAnnotations(placeList, animated: true)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            deletePlaceIndexPath = indexPath
            let placeToDelete = placeList[indexPath.row]
            confirmDelete(placeToDelete.title!)

        }
    }

    func confirmDelete(place: String) {
        let alert = UIAlertController(title: "Delete Place", message: "Are you sure you want to permanently delete \(place)?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeletePlace)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeletePlace)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func handleDeletePlace(alertAction: UIAlertAction!) -> Void {
        if let indexPath = deletePlaceIndexPath {
            tableView.beginUpdates()
            
            placeList.removeAtIndex(indexPath.row)
            
            // Note that indexPath is wrapped in an array:  [indexPath]
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            deletePlaceIndexPath = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelDeletePlace(alertAction: UIAlertAction!) {
        deletePlaceIndexPath = nil
    }
    
}
