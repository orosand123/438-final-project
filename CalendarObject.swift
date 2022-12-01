//
//  CalendarObject.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import MapKit



class WUClass: Codable{
    let building: Buildings
    let name: String
    let days: [Bool]
    let time: Date
    
    init(building: Buildings, name: String, days: [Bool], time: Date){
        self.building = building
        self.name = name
        self.days = days
        self.time = time
    }
}


class Buildings: NSObject, MKAnnotation, Codable {
    let title : String?
    let locationName: String
    let latitude: Double
    let longitude: Double
    var coordinate:  CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.locationName = locationName
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
    }
    
    var subtitle: String?{
        return locationName
    }
    
}

struct BuildingList: Codable{
    var buildings: [Buildings]
}
