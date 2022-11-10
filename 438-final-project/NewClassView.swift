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
    @IBOutlet weak var buildingResults: UITableView!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBAction func addClassButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var classTime = Date()
        let dateFormatter = DateFormatter()
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
    }
    @objc func timePickerValueChanged(sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss"
        print(dateFormatter.string(from: sender.date))
    }
    
}

