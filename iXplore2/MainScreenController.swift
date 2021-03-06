//
//  ViewController.swift
//  iXplore2
//
//  Created by Lauren Caverly on 6/8/16.
//  Copyright © 2016 Lauren Caverly. All rights reserved.
//

import UIKit
import MapKit

class MainScreenController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var placeList = [Place]()
    
//    var customPin = CustomAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        
        self.navigationController?.navigationBarHidden = false
        self.mapViewSetup()
        self.tableViewSetup()
//        
//        placeList = Place.placeList()
        
        self.mapView.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addTapped))
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func mapViewSetup() {
        self.mapView.mapType = .Hybrid
        self.mapView.showsPointsOfInterest = true
        self.mapView.addAnnotations(placeList)
        
        
    }
    
    
    
    func tableViewSetup () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.registerClass(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
    }
    
    
    
    
  //  Map View Setup
    func mapView(mapView: MKMapView,
                 viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let pin = annotation as! Place
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
            
            if !(pin.favorite) {
                pinView?.pinTintColor = UIColor.redColor()
            } else {
                pinView?.pinTintColor = UIColor.yellowColor()
            }
        }
        else {
            
            pinView!.annotation = annotation
        }
        
        return pinView!
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
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: placeList[indexPath.row].coordinate.latitude, longitude : placeList[indexPath.row].coordinate.longitude) , span: MKCoordinateSpanMake(0.015, 0.015))
        mapView.setRegion(region, animated: true)
        
        self.mapView.showAnnotations(placeList, animated: true)
        self.mapView.selectAnnotation(placeList[indexPath.row], animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    // This is a generic implementation of the table data source method for adding row actions.
    // Adapt it to match your needs.
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Destructive, title: "Delete") { delete, index in
            print("Delete tapped")
            
            tableView.beginUpdates()
            
            self.placeList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            tableView.endUpdates()
            self.mapView.removeAnnotation(self.placeList[indexPath.row])
        }
        delete.backgroundColor = UIColor.redColor()
        
        
        let favorite = UITableViewRowAction(style: .Normal, title: "Favorite") { favorite, index in
            print("Favorite tapped")
            
            tableView.beginUpdates()
            
            self.placeList[indexPath.row].favorite = true
            print(self.placeList[indexPath.row].favorite)
            
            
            tableView.endUpdates()
            
        }
        favorite.backgroundColor = UIColor.orangeColor()
        
        
        return [delete, favorite]
    }
    
    
    
    //add modal view
    @IBAction func addTapped() {
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.modalPresentationStyle = .CurrentContext
        self.presentViewController(NewPlaceViewController(), animated: true, completion: nil)
    }
    
    
    
    //Swipe to delete functionality
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            deletePlaceIndexPath = indexPath
//            let placeToDelete = placeList[indexPath.row]
//            confirmDelete(placeToDelete.title!)
//
//        }
//    }
//
//    func confirmDelete(place: String) {
//        let alert = UIAlertController(title: "Delete Place", message: "Are you sure you want to permanently delete \(place)?", preferredStyle: .ActionSheet)
//        
//        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: handleDeletePlace)
//        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelDeletePlace)
//        
//        alert.addAction(DeleteAction)
//        alert.addAction(CancelAction)
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//    }
//    
//    func handleDeletePlace(alertAction: UIAlertAction!) -> Void {
//        if let indexPath = deletePlaceIndexPath {
//            tableView.beginUpdates()
//            
//            placeList.removeAtIndex(indexPath.row)
//            
//            // Note that indexPath is wrapped in an array:  [indexPath]
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//            
//            deletePlaceIndexPath = nil
//            
//            tableView.endUpdates()
//        }
//    }
//    
//    func cancelDeletePlace(alertAction: UIAlertAction!) {
//        deletePlaceIndexPath = nil
//    }
    
    
    
}
