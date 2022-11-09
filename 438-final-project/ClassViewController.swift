//
//  ClassViewController.swift
//  438-final-project
//
//  Created by Kevin Oloomi on 11/8/22.
//

import UIKit
import CoreLocation

class ClassViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //tableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //BuildingNames
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = classes[indexPath.row].locationName
        
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
        print ("pushBuildingToClasses")
    }
    
    
    
    //Classes
    let classes = [Buildings(title: "Whitaker", locationName: "Whitaker", coordinate: CLLocationCoordinate2DMake(38.64915, 90.30338)),Buildings(title: "Jubel", locationName: "Jubel", coordinate: CLLocationCoordinate2DMake(38.64854, 90.30345)),Buildings(title: "McKelvey", locationName: "McKelvey", coordinate: CLLocationCoordinate2DMake(38.64810, 90.30171)),Buildings(title: "Green", locationName: "Green", coordinate: CLLocationCoordinate2DMake(38.64894, 90.30160)) ].sorted(by: {$0.locationName < $1.locationName})

    
    //ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // Do any additional setup after loading the view.
    }
    
    
    //Outlets and Actions
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func nameOfClass(_ sender: Any) {
    }
    

}
