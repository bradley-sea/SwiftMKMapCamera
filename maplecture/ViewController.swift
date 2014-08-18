//
//  ViewController.swift
//  maplecture
//
//  Created by Bradley Johnson on 8/17/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,UITextFieldDelegate, MKMapViewDelegate {
                            
    @IBOutlet weak var longField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.longField.delegate = self
        self.latField.delegate = self
        
        self.mapView.delegate = self
        
        //map settings
        self.mapView.zoomEnabled = true
        self.mapView.scrollEnabled = true
        self.mapView.pitchEnabled = true
        self.mapView.showsBuildings = true
        self.mapView.showsPointsOfInterest = true
        
        
        
        
        //give map initial region
//        var location = CLLocationCoordinate2D(latitude: 39.4864, longitude: -106.0436)
//        self.mapView.region = MKCoordinateRegionMakeWithDistance(location, 10000, 10000)
        // Do any additional setup after loading the view, typically from a nib.
        
        var ground = CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0444)
        var eye = CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0442)
        
        var camera = MKMapCamera(lookingAtCenterCoordinate: ground, fromEyeCoordinate: eye, eyeAltitude: 50)
        
        self.mapView.camera = camera
    }
    @IBAction func goPressed(sender: AnyObject) {
        
        var latString = NSString(string: self.latField.text)
        var lat = latString.doubleValue
        var longString = NSString(string: self.longField.text)
        var long = latString.doubleValue
        
        var newLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        self.mapView.region = MKCoordinateRegionMakeWithDistance(newLocation, 10000, 10000)
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

