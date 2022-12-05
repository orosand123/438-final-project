//
//  MapViewController.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

class MapViewController: ViewController,MKMapViewDelegate,CLLocationManagerDelegate{

    //outlets and actions
    @IBOutlet weak var mapView: MKMapView!
    
    
    //instance vars
    var theBuilding : Buildings?
    let currentLocation = CLLocationManager()
    var lat = 0.0
    var long = 0.0
    var routeTime = 0.0;
    var routeDistance = 0.0;
    @IBOutlet weak var estimatedTime: UILabel!
    
    @IBOutlet weak var distanceToBuilding: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentLocation.requestAlwaysAuthorization()
        self.currentLocation.requestWhenInUseAuthorization()
        currentLocation.delegate = self
        currentLocation.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        currentLocation.startUpdatingLocation()
        mapView.showsUserLocation = true
        mapView.delegate = self
        if let building = theBuilding{
            mapView.addAnnotation(building)
        }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.64859, longitude: -90.30775), latitudinalMeters: 1500, longitudinalMeters: 1500)
        mapView.setRegion(region, animated: true)
        
    }
    
    @IBSegueAction func showARView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: HomeView())
    }
    
    
    func getDirections()
        {if let building = theBuilding{
            //https://stackoverflow.com/questions/29319643/how-to-draw-a-route-between-two-locations-using-mapkit-in-swift
            let findDirections = MKDirections.Request()
            let currentLocation = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
            findDirections.source = MKMapItem(placemark: currentLocation)
            
            let buildingCoordinates = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: building.latitude, longitude: building
                .longitude))
            findDirections.destination = MKMapItem(placemark: buildingCoordinates)
            findDirections.transportType = .walking //requests only the walking directions
            let directions = MKDirections(request: findDirections)
            directions.calculate { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "No error specified").") //will return "no route available" if there is route (usually happens if any coordinates are 0.0
                            return
                }
                let walkingRoute = response.routes[0]
                //https://stackoverflow.com/questions/27338573/rounding-a-double-value-to-x-number-of-decimal-places-in-swift
                self.estimatedTime.text = "Estimated Travel Time: \(Int(round(walkingRoute.expectedTravelTime/60.0))) minutes"
                self.distanceToBuilding.text = "Distance: \(Int(round(walkingRoute.distance*3.28084))) feet"
                self.mapView.addOverlay(walkingRoute.polyline, level: .aboveRoads)
            }
        }
            
        }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLoc: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        lat = currentLoc.latitude
        long = currentLoc.longitude
        getDirections() //fetches and displays the directions
    }
    
    //this render function is the one causing all the complier error: invalid library file problems but not sure how to fix and it doesnt cause any real functional problems
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        //https://medium.com/fabcoding/swift-display-route-between-2-locations-using-mapkit-7de8ee0acd38
         let routeRender = MKPolylineRenderer(overlay: overlay)
         routeRender.strokeColor = UIColor(red: 0/255, green: 115/255, blue: 96/255, alpha: 0.7)
         routeRender.lineWidth = 5.0 //makes the route viewable
         return routeRender
    }

}
