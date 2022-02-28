//
//  ViewController.swift
//  Map
//
//  Created by seungyeop on 2022/02/26.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    lblLocationInfo1.text = ""
    lblLocationInfo2.text = ""
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
    myMap.showsUserLocation = true
    
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}

