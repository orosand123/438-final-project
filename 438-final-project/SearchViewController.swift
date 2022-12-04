//
//  SearchViewController.swift
//  438-final-project
//
//  Created by Ollie Rosand on 11/8/22.
//

import Foundation
import CoreLocation
import UIKit

class SearchViewController: ViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    let searchController = UISearchController()
    var currentInt = 0
    var buildings: [Buildings] = []
    var fullBuildingList: [Buildings] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //BuildingNames
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel!.text = buildings[indexPath.row].locationName
        
        //Style
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: 165/255, green: 20/255, blue: 23/255, alpha: 0.1)
        }
        else{
            cell.backgroundColor = UIColor(red: 165/255, green: 20/255, blue: 23/255, alpha: 0.2)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentInt = indexPath.row
        performSegue(withIdentifier: "buildingSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapVC = segue.destination as? MapViewController
        mapVC?.theBuilding = buildings[currentInt]
    }
    func loadData() -> [Buildings]{
        let path = Bundle.main.path(forResource: "building list", ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        let arr = try! decoder.decode([Buildings].self, from: data)
        return(arr)
    }
    //ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fullBuildingList = loadData()
        buildings = fullBuildingList
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text{
            if (text != ""){
                self.buildings = self.fullBuildingList.filter {
                    $0.title?.lowercased().contains(text.lowercased()) ?? false
                                }
                
            } else {
                self.buildings = self.fullBuildingList
            }
        }
                tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
}
