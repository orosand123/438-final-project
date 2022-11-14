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
                    classes.append(WUClass(building: buildings[indexPath.row], name: "Default1"))
        }
        else{
            classes.append(WUClass(building: buildings[indexPath.row], name: "\(nameOfClass.text!)"))
        }
                
               
        //segue
        performSegue(withIdentifier: "unwindToCalendar", sender: self)
                
        
    }
    
    
    //buildings
    let buildings = [Buildings(title: "Whitaker Hall", locationName: "Whitaker Hall", coordinate: CLLocationCoordinate2DMake(38.64915, -90.30338)),Buildings(title: "Jubel Hall", locationName: "Jubel Hall", coordinate: CLLocationCoordinate2DMake(38.64854, -90.30345)),Buildings(title: "McKelvey Hall", locationName: "McKelvey Hall", coordinate: CLLocationCoordinate2DMake(38.64810, -90.30171)),Buildings(title: "Green Hall", locationName: "Green Hall", coordinate: CLLocationCoordinate2DMake(38.64894, -90.30160)) ].sorted(by: {$0.locationName < $1.locationName})

    
    //ViewController
    func saveData(_ buildings:[Buildings]) throws{
        if let encoded = try? JSONEncoder().encode(buildings) {
            UserDefaults.standard.set(encoded, forKey: "buildings")
        }
        print("success")
     }
    func loadData() -> [Buildings]{
        let defaults = UserDefaults.standard
        var buildings: [Buildings] = []
        if let Data = defaults.object(forKey: "buildings") as? Data {
            let Decoder = JSONDecoder()
            if let buildings2 = try? Decoder.decode([Buildings].self, from: Data) {
                buildings = buildings2
            }
    }
        return buildings
    }
    //ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("inside classes")
        try! saveData(buildings)
        let buildings1 = loadData()
        print(buildings1[1].title)
        // Do any additional setup after loading the view.
    }
    
    
    //Outlets and Actions
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameOfClass: UITextField!
    
}
