//
//  MainViewController.swift
//  BeBraveProtoType
//
//  Created by bumslap on 20/01/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let nestedTableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    let nestedCellIdentifier = "nestedCell"
    let nestedColletionViewCellIdentifier = "nestedCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setUpUI()
        
        // Do any additional setup after loading the view.
    }
    
    func setTableView() {
        
        nestedTableView.register(NestedTableViewCell.self, forCellReuseIdentifier: nestedCellIdentifier)
        nestedTableView.dataSource = self
        nestedTableView.delegate = self
    }

    
    func setUpUI() {
        view.addSubview(nestedTableView)
        nestedTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nestedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        nestedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nestedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: nestedCellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? NestedTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nestedColletionViewCellIdentifier, for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
    }
    
    
}
