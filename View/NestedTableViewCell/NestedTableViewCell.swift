//
//  NestedTableViewCell.swift
//  BeBraveProtoType
//
//  Created by bumslap on 20/01/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import UIKit

class NestedTableViewCell: UITableViewCell {
    
    let nestedColletionViewCellIdentifier = "nestedCollectionCell"
    let nestedCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        nestedCollectionView.register(NestedCollectionViewCell.self, forCellWithReuseIdentifier: nestedColletionViewCellIdentifier)
    }
    
    override func prepareForReuse() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        contentView.addSubview(nestedCollectionView)
        nestedCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nestedCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        nestedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        nestedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
        nestedCollectionView.delegate = dataSourceDelegate
        nestedCollectionView.dataSource = dataSourceDelegate
        nestedCollectionView.tag = row
        nestedCollectionView.reloadData()
    }
}
