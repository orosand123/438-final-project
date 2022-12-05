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
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64847034462544,    // Tokyo station <== please change to a location near you
            longitude: -90.30325501926816,//               <== please change to a location near you
            altitude: 195),
        
        ModelAsset(
            id: UUID(),
            name: "Busch",
            thumbnailFile: "washu",
            assetFile: "Busch",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 110,
            approachingDistance: 150.0, // [m]
            distanceAway:150.0, // [m]
            latitude: 38.647449731305855,    // Tokyo station <== please change to a location near you
            longitude: -90.3057247258967,//               <== please change to a location near you
            altitude: 200),
        
        ModelAsset(
            id: UUID(),
            name: "Cupples",
            thumbnailFile: "washu",
            assetFile: "Cupples",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 202.0,
            approachingDistance: 150.0, // [m]
            distanceAway:150.0, // [m]
            latitude: 38.64868781312009,    // Tokyo station <== please change to a location near you
            longitude: -90.30551853011286,//               <== please change to a location near you
            altitude: 210),
        
        ModelAsset(
            id: UUID(),
            name: "Hillman",
            thumbnailFile: "washu",
            assetFile: "Hillman Hall",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 110,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.646769832558824,    // Tokyo station <== please change to a location near you
            longitude: -90.3046655286652,//               <== please change to a location near you
            altitude: 195),
        
        ModelAsset(
            id: UUID(),
            name: "Kemper",
            thumbnailFile: "washu",
            assetFile: "Kemper",
            scale: SIMD3<Float>(0.10, 0.10, 0.10),
            orientationOnYAxis: 60,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64693457745589,    // Tokyo station <== please change to a location near you
            longitude: -90.30254753658086,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Parkside",
            thumbnailFile: "washu",
            assetFile: "Parkside Cafe",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
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
            assetFile: "Ridgley Hall",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 77.0,
            approachingDistance: 150.0, // [m]
            distanceAway:150.0, // [m]
            latitude: 38.64812412346964,    // Tokyo station <== please change to a location near you
            longitude: -90.30618678135639,//               <== please change to a location near you
            altitude: 200),
        
        ModelAsset(
            id: UUID(),
            name: "Rudolph",
            thumbnailFile: "washu",
            assetFile: "Rudolph Hall",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.64904315759363,    // Tokyo station <== please change to a location near you
            longitude: -90.30449690520358,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Sumers",
            thumbnailFile: "washu",
            assetFile: "Sumers Welcome Center",
            scale: SIMD3<Float>(0.10, 0.10, 0.10),
            orientationOnYAxis: 9,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.64742491420589,    // Tokyo station <== please change to a location near you
            longitude: -90.30402874272984,//               <== please change to a location near you
            altitude: 185),
        
        
        ModelAsset(
            id: UUID(),
            name: "Weil",
            thumbnailFile: "washu",
            assetFile: "Weil Hall",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 110,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.647253436423796,    // Tokyo station <== please change to a location near you
            longitude: -90.30334878108758,//               <== please change to a location near you
            altitude: 185),
        
        
        ModelAsset(
            id: UUID(),
            name: "Whitaker",
            thumbnailFile: "washu",
            assetFile: "Whitaker Hall",
            scale: SIMD3<Float>(0.25, 0.25, 0.25),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.649148079969756,    // Tokyo station <== please change to a location near you
            longitude: -90.30314958541175,//               <== please change to a location near you
            altitude: 185),
        
        ModelAsset(
            id: UUID(),
            name: "Brookings",
            thumbnailFile: "washu",
            assetFile: "Brookings",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 77,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.6482723584091,    // Tokyo station <== please change to a location near you
            longitude: -90.30511582634888,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Siegel",
            thumbnailFile: "washu",
            assetFile: "Siegel",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 77,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.648972448797096,    // Tokyo station <== please change to a location near you
            longitude: -90.31249183769508,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Knight",
            thumbnailFile: "washu",
            assetFile: "Knight",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64952482392642,    // Tokyo station <== please change to a location near you
            longitude: -90.31120882987494,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Eads",
            thumbnailFile: "washu",
            assetFile: "Eads",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 0,
            approachingDistance: 200.0, // [m]
            distanceAway:300.0, // [m]
            latitude: 38.64822190176297,    // Tokyo station <== please change to a location near you
            longitude: -90.30677847596989,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Duc",
            thumbnailFile: "washu",
            assetFile: "Duc",
            scale: SIMD3<Float>(0.10, 0.10, 0.10),
            orientationOnYAxis: 9,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.647836981513706,    // Tokyo station <== please change to a location near you
            longitude: -90.3102920289154,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Wilson",
            thumbnailFile: "washu",
            assetFile: "Wilson",
            scale: SIMD3<Float>(0.10, 0.10, 0.10),
            orientationOnYAxis: 9,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.64755091125649,    // Tokyo station <== please change to a location near you
            longitude: -90.30706857649764,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Simon",
            thumbnailFile: "washu",
            assetFile: "Simon",
            scale: SIMD3<Float>(0.10, 0.10, 0.10),
            orientationOnYAxis: 9,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.64809635674551,    // Tokyo station <== please change to a location near you
            longitude: -90.31148767899332,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Graham",
            thumbnailFile: "washu",
            assetFile: "Graham",
            scale: SIMD3<Float>(0.11, 0.11, 0.11),
            orientationOnYAxis: 77,
            approachingDistance: 200.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.64822594411162,    // Tokyo station <== please change to a location near you
            longitude: -90.30885993666273,//               <== please change to a location near you
            altitude: 230),
        
        ModelAsset(
            id: UUID(),
            name: "Olin",
            thumbnailFile: "washu",
            assetFile: "Olin",
            scale: SIMD3<Float>(0.15, 0.15, 0.15),
            orientationOnYAxis: 77,
            approachingDistance: 0.0, // [m]
            distanceAway:200.0, // [m]
            latitude: 38.648641354985635,    // Tokyo station <== please change to a location near you
            longitude: -90.30774192809943,//               <== please change to a location near you
            altitude: 230),
        
    ]
}
