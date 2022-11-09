//
//  MapViewController.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import CoreLocation
import MapKit

class MapViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//
    }
    
    let latitude: CLLocationDegrees = 40.0
    let longitude: CLLocationDegrees = -76.0
    
    let regionDistance:CLLocationDistance = 1000
    let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    let region = MKCoordinateRegion.init(coordinates,regionDistance,regionDistance)
    
    

}
