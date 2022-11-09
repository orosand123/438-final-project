//
//  CalendarObject.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import MapKit
//
//class WUClass{
//    let building: Building
//    let name: String
//    let day: Day
//    let time: time_value
//}
//


class Buildings: NSObject, MKAnnotation {
    let title : String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    var subtitle: String?{
        return locationName
    }
    
}

struct Building{
    let name: String
    let coords: CLLocation
}

//enum Day{
//    case Monday
//    case Tuesday
//    case Wednesday
//    case Thursday
//    case Friday
//}
