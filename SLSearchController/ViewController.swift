//
//  ViewController.swift
//  SLSearchController
//
//  Created by ankitkargathra on 09/24/2018.
//  Copyright (c) 2018 ankitkargathra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: Variable Declaration
    
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var tableView: UITableView!
    
    var fruits = [Fruit.init(name: "Apple", detail: "Type: Fruit"),
                  Fruit.init(name: "Banana", detail: "Type: Fruit"),
                  Fruit.init(name: "Coconut", detail: "Type: Fruit"),
                  Fruit.init(name: "Cranberry", detail: "Type: Fruit"),
                  Fruit.init(name: "Guava", detail: "Type: Fruit"),
                  Fruit.init(name: "Jujube", detail: "Type: Fruit"),
                  Fruit.init(name: "Honeyberry", detail: "Type: Fruit"),
                  Fruit.init(name: "Mango", detail: "Type: Fruit"),
                  Fruit.init(name: "Papaya", detail: "Type: Fruit"),
                  Fruit.init(name: "Peach", detail: "Type: Fruit"),
                  Fruit.init(name: "Rose", detail: "Type: Flower"),
                  Fruit.init(name: "Amaranth", detail: "Type: Flower"),
                  Fruit.init(name: "Azalea", detail: "Type: Flower"),
                  Fruit.init(name: "Begonia", detail: "Type: Flower")]
    
    
    var filterdFruits = [Fruit]()
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Fruite"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        self.title = "SLSearchController"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView Datasource And delegate method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filterdFruits.count
        } else {
            return fruits.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        var fruit = Fruit.init(name: "", detail: "")
        
        if isFiltering() {
            fruit = filterdFruits[indexPath.row]
        } else {
            fruit = fruits[indexPath.row]
        }
        
        cell.textLabel?.text = fruit.name
        cell.detailTextLabel?.text = fruit.detail
        
        return cell
        
    }
    
    // MARK: Filter Data
    func filterContentForSearchText(_ searchText: String) {
        filterdFruits = self.fruits.filter({( fruit : Fruit) -> Bool in
            return fruit.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && (!searchBarIsEmpty())
    }
    
}

extension ViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

