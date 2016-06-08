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
    
    var placeList = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = true
        self.mapViewSetup()
        self.tableViewSetup()
        
        
        placeList = Place.placeList()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func mapViewSetup() {
        
        self.mapView.mapType = .HybridFlyover
        self.mapView.showsPointsOfInterest = true
        self.mapView.addAnnotations(placeList as! [MKAnnotation])
    }
    
    
    
    func tableViewSetup () {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.registerNib(UINib(nibName: "tableViewCell", bundle: nil), forCellReuseIdentifier: "tableViewCell")
    }
    
    
    
    //Table View Setup
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> tableViewCell {
        
        let cell = tableViewCell()
        
        let row = indexPath.row
        
        cell.cellLabel.text = "test"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: self.placeList[indexPath.row].coordinate.latitude,longitude: self.placeList[indexPath.row].coordinate.longitude)
        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,MKCoordinateSpanMake(0.01, 0.01)))
        mapView.setRegion(adjustedRegion, animated: true)
        
        self.mapView.setCenterCoordinate(mapCenterCoordinateAfterMove, animated: true)
        self.mapView.region = adjustedRegion
        self.mapView.showAnnotations(placeList as! [MKAnnotation], animated: true)
    }
    
}
