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
    var classTime = time_value
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var buildingSearchBar: UITextField!
    @IBOutlet weak var buildingResults: UITableView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func addClassButton(_ sender: Any) {
    }
    
}

