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
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}

