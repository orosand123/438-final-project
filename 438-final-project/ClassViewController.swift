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
    @IBOutlet weak var timePicker: UIDatePicker!
    var classes: [WUClass] = []
    var selectedBuilding: Buildings?
    var buildings: [Buildings] = []
    var fullBuildingList: [Buildings] = []
    var days: [Bool] = [false,false,false,false,false]
    
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
            cell.backgroundColor = UIColor(red: 165/255, green: 20/255, blue: 23/255, alpha: 0.2)
        }
        else{
            cell.backgroundColor = UIColor(red: 165/255, green: 20/255, blue: 23/255, alpha: 0.1)
        }
        if selectedBuilding == buildings[indexPath.row]{
            cell.backgroundColor = UIColor.systemGreen
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.systemGreen
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBuilding =  buildings[indexPath.row]
        }
  
    @IBAction func classAddButton(_ sender: Any) {
        
        if nameOfClass.text?.count == 0 {
            let errorAlert = UIAlertController(title: "Error", message: "Please enter a class name", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            errorAlert.addAction(OKAction)
            present(errorAlert, animated: true)
        }
        else{
            if let building = selectedBuilding{
                classes = loadClassData()
                classes.append(WUClass(building: building, name: "\(nameOfClass.text!)", days: days, time: timePicker.date))
                try! saveClassData(classes)
                performSegue(withIdentifier: "unwindToCalendar", sender: self)
            } else{
                let errorAlert = UIAlertController(title: "Error", message: "Please select a building", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                errorAlert.addAction(OKAction)
                present(errorAlert, animated: true)
            }
            
        }
    }
    //functions
//    The following is used to update the building list if needed:
    
//    func saveData(_ buildings:[Buildings]) throws{
//        let manager = FileManager.default
//        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
//        let fileUrl = url.appendingPathComponent("building list.plist")
//        try! manager.createFile(atPath: fileUrl.path, contents: nil, attributes: nil)
//        let encoder = PropertyListEncoder()
//        let encodedData = try! encoder.encode(buildings)
//        try! encodedData.write(to: fileUrl)
//    }
    
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
        fullBuildingList = loadData()
        buildings = fullBuildingList
    }
    
    
    @IBAction func buildingSearchChanged(_ sender: Any) {
        self.buildings = self.fullBuildingList.filter {
            $0.title?.lowercased().contains(buildingSearchBar.text?.lowercased() ?? "") ?? false
                        }
        tableView.reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buildingSearchBar: UITextField!
    @IBOutlet weak var nameOfClass: UITextField!
    
    @IBAction func monButton(_ sender: Any) {
        if let button = sender as? UIButton {
            days[0] = !days[0]
            button.isSelected = days[0]
            }
    }
    @IBAction func tuesButton(_ sender: Any) {
        if let button = sender as? UIButton {
            days[1] = !days[1]
            button.isSelected = days[1]
            }
    }
    @IBAction func wedsButton(_ sender: Any) {
        if let button = sender as? UIButton {
            days[2] = !days[2]
            button.isSelected = days[2]
            }
    }
    @IBAction func thursButton(_ sender: Any) {
        if let button = sender as? UIButton {
            days[3] = !days[3]
            button.isSelected = days[3]
            }
    }
    @IBAction func friButton(_ sender: Any) {
        if let button = sender as? UIButton {
            days[4] = !days[4]
            button.isSelected = days[4]
            }
    }
}
