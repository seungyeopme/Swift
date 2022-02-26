//
//  ViewController.swift
//  Map
//
//  Created by seungyeop on 2022/02/26.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
}

