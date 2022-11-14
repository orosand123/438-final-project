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
            cell.backgroundColor = UIColor.systemGray5
        }
        else{
            cell.backgroundColor = UIColor.systemGray6
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
        print("inside classes")
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
        
        print(buildings.count)
        tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
}
