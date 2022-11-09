//
//  CalendarObject.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import MapKit

class WUClass{
    let building: Building
    let name: String
    let day: Day
    let time: time_value
}

class Building{
    let name: String
    let coords: CLLocation
}

enum Day{
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
