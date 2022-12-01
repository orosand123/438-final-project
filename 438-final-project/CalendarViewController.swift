//
//  CalendarView.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import UIKit
class CalendarViewController: ViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as? MapViewController
        mapVC?.theBuilding = calendarSchedule[currentInt].building
    }
    
    //tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarSchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = calendarSchedule[indexPath.row].name
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentInt = indexPath.row
        performSegue(withIdentifier: "mapSegue", sender: self)
    }
    

    //instance vars
    var calendarSchedule: [WUClass] = []
    var currentInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        calendarSchedule = loadClassData()
        tableView.reloadData()
    }
    
    
    //functions
    func loadClassData() -> [WUClass]{
        var classSchedule: [WUClass] = []
        if let data = UserDefaults.standard.object(forKey: "schedule") as? Data{
            if let classSchedule2 = try? JSONDecoder().decode([WUClass].self, from: data){
                classSchedule = classSchedule2
            }
        }
        return classSchedule
    }
    
    //outlets and actions
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        print("cashMoney")
        tableView.reloadData()
        //everything that involves reloading is here
        
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func clearButton(_ sender: Any) {
        calendarSchedule.removeAll()
        UserDefaults.standard.removeObject(forKey: "schedule")
        if let encoded = try? JSONEncoder().encode(calendarSchedule){
            UserDefaults.standard.set(encoded, forKey: "schedule")
        }
        tableView.reloadData()
    }
    func deleteClass(index: Int){
        calendarSchedule.remove(at: index)
        if let encoded = try? JSONEncoder().encode(calendarSchedule){
            UserDefaults.standard.set(encoded, forKey: "schedule")
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
            let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                self.deleteClass(index: indexPath[1])
                completionHandler(true)
            }
                delete.image = UIImage(systemName: "trash")
                delete.backgroundColor = UIColor.systemRed
            let config = UISwipeActionsConfiguration(actions: [delete])
            return config
    }

}
