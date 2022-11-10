//
//  NewClassView.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/9/22.
//

import Foundation
import UIKit

class NewClassView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var NewClass: WUClass?
    var className = ""
    var classDays: [Day] = []
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buildingCell", for: indexPath) as UITableViewCell
        return cell
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buildingSearchBar: UITextField!
    @IBOutlet weak var dayDropDown: UIButton!
    @IBOutlet weak var buildingResults: UITableView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBAction func addClassButton(_ sender: Any) {
    }
    private lazy var dayMenu = UIMenu(title: "Day Selection", children: [
        UIAction(title: "Monday", attributes: [], state: .off) {
            action in
            print("Monday")
        },
        UIAction(title: "Tuesday", attributes: [], state: .off) {
            action in
            print("Tuesday")
        },
        UIAction(title: "Wednesday", attributes: [], state: .off) {
            action in
            print("Monday")
        },
        UIAction(title: "Wednesday", attributes: [], state: .off) {
            action in
            print("Monday")
        },
        UIAction(title: "Wednesday", attributes: [], state: .off) {
            action in
            print("Monday")
        }
    ])
    override func viewDidLoad() {
        super.viewDidLoad()
        var classTime = Date()
        let dateFormatter = DateFormatter()
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        dayDropDown.showsMenuAsPrimaryAction = true
        dayDropDown.menu = dayMenu
        dayDropDown.setTitle("Days", for: .normal)
        
    }
    @objc func timePickerValueChanged(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        print(dateFormatter.string(from: sender.date))
    }
    
}

