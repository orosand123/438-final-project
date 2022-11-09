//
//  CalendarView.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import UIKit
class CalendarViewController: ViewController, UITableViewDataSource {
    
    
    //tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendarSchedule.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = calendarSchedule[indexPath.row].name
        return cell
        
    }
    

    //instance vars
    var calendarSchedule: [WUClass] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        print("cashMoney")
        tableView.reloadData()
        //everything that involves reloading is here
        
        
    }

    //outlets and actions
    @IBOutlet weak var tableView: UITableView!
    

}
