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
         let layout: OverlapCollectionViewLayout = OverlapCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    let customLayout: OverlapCollectionViewLayout = {
        let layout: OverlapCollectionViewLayout = OverlapCollectionViewLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
       //nestedCollectionView.collectionViewLayout.
      //  nestedCollectionView.contentInsetAdjustmentBehavior = .never
        nestedCollectionView.register(NestedCollectionViewCell.self, forCellWithReuseIdentifier: nestedColletionViewCellIdentifier)
    }
    
    override func prepareForReuse() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpUI() {
        contentView.addSubview(nestedCollectionView)
        
        //nestedCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1).isActive = true
        //nestedCollectionView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1).isActive = true
      //  nestedCollectionView.backgroundColor = UIColor.gray
        nestedCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nestedCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        nestedCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        nestedCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate & UICollectionViewDelegateFlowLayout, forRow row: Int) {
        nestedCollectionView.delegate = dataSourceDelegate
        nestedCollectionView.dataSource = dataSourceDelegate
      //  nestedCollectionView
        nestedCollectionView.tag = row
        nestedCollectionView.reloadData()
    }
}

