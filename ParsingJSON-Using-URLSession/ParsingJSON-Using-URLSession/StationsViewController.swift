//
//  ViewController.swift
//  ParsingJSON-Using-URLSession
//
//  Created by Cameron Rivera on 8/4/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

enum Section{
    case primary
}

class StationsViewController: UIViewController {

    // TODO: use the "region_id" to create multiple sections
    // create an enum to represent our table view sections
    
    @IBOutlet weak var tableView: UITableView!
    private let apiClient = APIClient()
    private var dataSource: UITableViewDiffableDataSource<Section,Station>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Citi Bike Stations"
        fetchData()
        configureDataSource()
    }

    private func fetchData() {
        // Result type has two values
        // 1. .failure() or 2. .success()
        apiClient.fetchData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                // TODO: Present an alert
            case .success(let stations):
                DispatchQueue.main.async { // Update UI on the main thread
                    self?.updateSnapshot(with: stations)
                }
            }
        }
    }
    
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section,Station>(tableView: tableView, cellProvider: { (tableView, indexPath, station) -> UITableViewCell? in
            let xCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            xCell.textLabel?.text = station.name
            xCell.detailTextLabel?.text = "Bike Capacity: \(station.capacity)"
            return xCell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Station>()
        snapshot.appendSections([.primary])
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
    
    private func updateSnapshot(with stations: [Station]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(stations, toSection: .primary)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }

}

// Place in its own file
// TODO: Continue to implement in order to show the section header titles
// subclass UITableViewDiffableDataSource

//class DataSource: UITableViewDiffableDataSource<Section,Station> {}

