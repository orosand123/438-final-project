//
//  CalendarView.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import UIKit
import UserNotifications
import CoreLocation

class CalendarViewController: ViewController, UNUserNotificationCenterDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    
    
    
    
    //functions
    func requestNotificationAuthorization() {
        // Code here
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
        }
    }

    var days = ["M","T","W","R","F"]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as? MapViewController
        mapVC?.theBuilding = calendarSchedule[currentInt].building
    }
    
    //tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarSchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel!.text = calendarSchedule[indexPath.row].name
        var description = ""
        for i in 0...4{
            if calendarSchedule[indexPath.row].days[i]{
                description += days[i]
            } else{
                description += "-"
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let time = dateFormatter.string(from: calendarSchedule[indexPath.row].time)
        
        description += "  " + String(time)
        cell.detailTextLabel?.text = description
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentInt = indexPath.row
        performSegue(withIdentifier: "mapSegue", sender: self)
    }
    
    @IBOutlet weak var classTitle: UILabel!
    
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
        self.userNotificationCenter.delegate = self
        self.requestNotificationAuthorization()
        scheduleNotifications()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
        guard let title = response.notification.request.content.userInfo["title"] as? String? else {
            return }
        guard let locName = response.notification.request.content.userInfo["locationName"] as? String else {
            return }
        guard let lat = response.notification.request.content.userInfo["lat"] as? Double else {
            return }
        guard let long = response.notification.request.content.userInfo["long"] as? Double else {
            return }
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let building = Buildings(title: title ?? "", locationName: locName, coordinate: coordinate)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MapView") as? MapViewController{
                vc.modalPresentationStyle = .popover
                vc.theBuilding = building
                self.present(vc,animated: true)
            }
            completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
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
        scheduleNotifications()
    }
    
    func deleteClass(index: Int){
        calendarSchedule.remove(at: index)
        if let encoded = try? JSONEncoder().encode(calendarSchedule){
            UserDefaults.standard.set(encoded, forKey: "schedule")
        }
        tableView.reloadData()
        scheduleNotifications()

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
    func scheduleNotifications(){
        userNotificationCenter.removeAllPendingNotificationRequests()
        for wuClass in calendarSchedule {
            scheduleNotif(wuClass: wuClass)
        }
    }
    func scheduleNotif(wuClass: WUClass){
        for i in 0...wuClass.days.count-1{
            if wuClass.days[i] {
                let calendar = Calendar.current
                let notifDate = calendar.date(byAdding: .minute, value: -15, to: wuClass.time) ?? wuClass.time
                var components = calendar.dateComponents([.weekday, .hour, .minute, .second], from: notifDate as Date)
                components.weekday = i + 2
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                
                let content = UNMutableNotificationContent()
                content.title = wuClass.name + "Starting in 15 minutes"
                content.body = "Tap here for directions to class!"
                content.categoryIdentifier = "todoList"
                content.userInfo = ["title":wuClass.building.title,"locationName": wuClass.building.locationName,"lat":wuClass.building.coordinate.latitude,"long":wuClass.building.coordinate.longitude]
                let request = UNNotificationRequest(identifier: "classNotificationFor"+wuClass.name+String(i), content: content, trigger: trigger)
                
                userNotificationCenter.add(request) {(error) in
                    if let error = error {
                        print("Error: \(error)")
                    }
                }
            }
        }
    }
}
