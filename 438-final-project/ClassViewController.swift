//
//  ClassViewController.swift
//  438-final-project
//
//  Created by Kevin Oloomi on 11/8/22.
//

import UIKit
import CoreLocation

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //vars
    var classes: [WUClass] = []
    var buildings: [Buildings] = []
    var fullBuildingList: [Buildings] = []
    
    
    //functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calendarVC = segue.destination as? CalendarViewController
        calendarVC?.calendarSchedule = classes
    }
    
    //tableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //BuildingNames
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = buildings[indexPath.row].locationName
        
        //Style
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemGray5
        }
        else{
            cell.backgroundColor = UIColor.systemGray6
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if nameOfClass.text?.count == 0 {
            classes = loadClassData()
            classes.append(WUClass(building: buildings[indexPath.row], name: "Default"))
            try! saveClassData(classes)
        }
        else{
            classes = loadClassData()
            classes.append(WUClass(building: buildings[indexPath.row], name: "\(nameOfClass.text!)"))
            try! saveClassData(classes)
        }
                
               
        //segue
        performSegue(withIdentifier: "unwindToCalendar", sender: self)
                
        
    }
    
    
    //buildings
    let buildingTempList = [Buildings(title: "Wwwwwwhitaker Hall", locationName: "Whitaker Hall", coordinate: CLLocationCoordinate2DMake(38.64915, -90.30338)),Buildings(title: "Jubel Hall", locationName: "Jubel Hall", coordinate: CLLocationCoordinate2DMake(38.64854, -90.30345)),Buildings(title: "McKelvey Hall", locationName: "McKelvey Hall", coordinate: CLLocationCoordinate2DMake(38.64810, -90.30171)),Buildings(title: "Green Hall", locationName: "Green Hall", coordinate: CLLocationCoordinate2DMake(38.64894, -90.30160)) ].sorted(by: {$0.locationName < $1.locationName})

    
    //functions
    func saveData(_ buildings:[Buildings]) throws{
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let fileUrl = url.appendingPathComponent("building list.plist")
        try! manager.createFile(atPath: fileUrl.path, contents: nil, attributes: nil)
        let encoder = PropertyListEncoder()
        let encodedData = try! encoder.encode(buildings)
        try! encodedData.write(to: fileUrl)
        print(fileUrl)
     }
    func loadData() -> [Buildings]{
        let path = Bundle.main.path(forResource: "building list", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        let arr = try! decoder.decode([Buildings].self, from: data)
        return(arr)
    }
    
    func saveClassData(_ classSchedule:[WUClass]) throws{
        if let encoded = try? JSONEncoder().encode(classSchedule){
            UserDefaults.standard.set(encoded, forKey: "schedule")
        }
    }
    
    func loadClassData() -> [WUClass]{
        var classSchedule: [WUClass] = []
        if let data = UserDefaults.standard.object(forKey: "schedule") as? Data{
            if let classSchedule2 = try? JSONDecoder().decode([WUClass].self, from: data){
                classSchedule = classSchedule2
            }
        }
        return classSchedule
    }
    
    
    //ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("inside classes")
        fullBuildingList = loadData()
        buildings = fullBuildingList
    }
    
    
    @IBAction func buildingSearchChanged(_ sender: Any) {
        self.buildings = self.fullBuildingList.filter {
            $0.title?.lowercased().contains(buildingSearchBar.text?.lowercased() ?? "") ?? false
                        }
        print(buildings.count)
        tableView.reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buildingSearchBar: UITextField!
    @IBOutlet weak var nameOfClass: UITextField!
    
}
