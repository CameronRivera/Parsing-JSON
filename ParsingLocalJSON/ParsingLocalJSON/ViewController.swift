//
//  ViewController.swift
//  ParsingLocalJSON
//
//  Created by Cameron Rivera on 8/3/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum Section {
        case main // Table View has only one section
    }
    
    typealias DataSource = UITableViewDiffableDataSource<Section,President>
    
    // Both the sectionItemIdentifier and the ItemIdentifier must conform to the hashable protocol. e.g. 
    private var dataSource: DataSource! // nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureDataSource()
        fetchPresidents()
    }
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { (tableView, indexPath, president) -> UITableViewCell? in
            // Configure Cell
            let xCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            xCell.textLabel?.text = president.name
            xCell.detailTextLabel?.text = "\(president.number)"
            return xCell
        })
        
        // Setup initial snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, President>()
        snapshot.appendSections([.main])
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
        
    }
    
    private func fetchPresidents() {
        var presidents: [President] = []
        do {
            presidents = try Bundle.main.parseJSON(with: "Presidents")
        } catch {
            let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
        
        // Update the snapshot
        var snapshot = dataSource.snapshot() // query dataSource for current snapshot
        snapshot.appendItems(presidents, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
}

