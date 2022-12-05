//
//  ModelDataSet.swift
//  arsimplegeolocation
//
//  Used public AR Geo Mapping Repo with permission from Yasuhito Nagatomo on 2022/06/18.
//

import Foundation

class ModelDataSet {
    private init() {}

    static let dataSet: [ModelAsset] = [
    
        
        ModelAsset(
            id: UUID(),
            name: "McKelveyHall",
            thumbnailFile: "McKelveyHall2",
            assetFile: "mcKelvey Hall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 100.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.648149356425805,    // Tokyo station <== please change to a location near you
            longitude: -90.30163082563756,//               <== please change to a location near you
            altitude: 180),       //               <== please change to a location near you
        
        
        
        ModelAsset(
            id: UUID(),
            name: "JubelHall",
            thumbnailFile: "McKelveyHall2",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64847034462544,    // Tokyo station <== please change to a location near you
            longitude: -90.30325501926816,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Busch",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.647449731305855,    // Tokyo station <== please change to a location near you
            longitude: -90.3057247258967,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Cupples",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64868781312009,    // Tokyo station <== please change to a location near you
            longitude: -90.30551853011286,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Hillman",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.646769832558824,    // Tokyo station <== please change to a location near you
            longitude: -90.3046655286652,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Kemper",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64693457745589,    // Tokyo station <== please change to a location near you
            longitude: -90.30254753658086,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Parkside",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64837259983998,    // Tokyo station <== please change to a location near you
            longitude: -90.30382973246833,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Ridgley",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64812412346964,    // Tokyo station <== please change to a location near you
            longitude: -90.30618678135639,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Rudolph",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64904315759363,    // Tokyo station <== please change to a location near you
            longitude: -90.30449690520358,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Sumers",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64742491420589,    // Tokyo station <== please change to a location near you
            longitude: -90.30402874272984,//               <== please change to a location near you
            altitude: 185),
        
        
        ModelAsset(
            id: UUID(),
            name: "Weil",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.647253436423796,    // Tokyo station <== please change to a location near you
            longitude: -90.30334878108758,//               <== please change to a location near you
            altitude: 185),
        
        
        ModelAsset(
            id: UUID(),
            name: "Whitaker",
            thumbnailFile: "washu",
            assetFile: "JubelHall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.649148079969756,    // Tokyo station <== please change to a location near you
            longitude: -90.30314958541175,//               <== please change to a location near you
            altitude: 185),
    ]
}
