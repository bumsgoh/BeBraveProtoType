//
//  MainViewController.swift
//  BeBraveProtoType
//
//  Created by bumslap on 20/01/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var currentArtwork: Int = 0
    var currentCollectionView: UICollectionView?
    let imageArray = [#imageLiteral(resourceName: "north"),#imageLiteral(resourceName: "photographer"),#imageLiteral(resourceName: "rays"),#imageLiteral(resourceName: "hamburg"),#imageLiteral(resourceName: "cat2"),#imageLiteral(resourceName: "cat1"),#imageLiteral(resourceName: "north")]
    let customLayout: OverlapCollectionViewLayout = {
        let layout: OverlapCollectionViewLayout = OverlapCollectionViewLayout()
        layout.scrollDirection = .horizontal
       // layout.estimatedItemSize = CGSize(width: 250.0 * layout.standardItemScale, height: 250.0 * layout.standardItemScale)
        layout.minimumLineSpacing = -(layout.itemSize.width * 0.9)
        return layout
    }()
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
        view.backgroundColor = .lightGray
        
        
        // Do any additional setup after loading the view.
    }
    
    func setTableView() {
        nestedTableView.tableFooterView = UIView()
        nestedTableView.register(NestedTableViewCell.self, forCellReuseIdentifier: nestedCellIdentifier)
        nestedTableView.dataSource = self
        nestedTableView.delegate = self
    }

    
    func setUpUI() {
        view.addSubview(nestedTableView)
        nestedTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nestedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        nestedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
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
       // cell.backgroundColor = UIColor.blue
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? NestedTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
       // tableViewCell.nestedCollectionView.collectionViewLayout = customLayout
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nestedColletionViewCellIdentifier, for: indexPath) as? NestedCollectionViewCell else { return .init() }
        
        cell.backgroundColor = UIColor.white
        cell.artworkImageView.image = imageArray[Int.random(in: 0...5)]
        
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
   
        return CGSize(width: 200, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let layout = collectionView.collectionViewLayout as? OverlapCollectionViewLayout else {
            print("not")
            return
        }
       // layout.minimumLineSpacing = -(layout.itemSize.width * 0.5)
        print(layout.itemSize)
    }
   
  
  
}

extension MainViewController {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        guard let currentCollectionView = scrollView as? UICollectionView else {
            return
        }
        let layout = currentCollectionView.collectionViewLayout as! OverlapCollectionViewLayout
        let cardSize = layout.itemSize.width + layout.minimumLineSpacing
        let offset = scrollView.contentOffset.x
        
        currentArtwork = Int(floor((offset - cardSize / 2) / cardSize) + 1)/3
        print(currentArtwork)
}
}
