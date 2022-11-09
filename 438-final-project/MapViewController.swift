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

    //outlets and actions
    @IBOutlet weak var mapView: MKMapView!
    
    
    //instance vars
    var theBuilding : Buildings?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.addAnnotation(theBuilding!)
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.64859, longitude: -90.30775), latitudinalMeters: 1500, longitudinalMeters: 1500)
        mapView.setRegion(region, animated: true)
        
    }
}
