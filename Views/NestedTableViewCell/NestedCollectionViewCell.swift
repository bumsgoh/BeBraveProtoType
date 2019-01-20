//
//  NestedCollectionViewCell.swift
//  BeBraveProtoType
//
//  Created by bumslap on 20/01/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import UIKit

class NestedCollectionViewCell: UICollectionViewCell {
   
    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "cat1")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let loveItButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "loveit"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.8411337733, green: 0.3516849279, blue: 0.2877530754, alpha: 1)
        return button
    }()
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.text = "Lorem Ipsum"
        return label
    }()
    
    let contentslabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "consectetur adipiscing elit, sed"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
       
        //self.layer.borderWidth = 6
       //self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
        setUpUI()
        artworkImageView.clipsToBounds = true
        //self.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = self.frame.size.width * 0.15
        self.contentView.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        
        self.layer.cornerRadius = self.frame.size.width * 0.15
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 2.0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error")
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       // artworkImageView.image = nil
      //  titlelabel.text = ""
        
    }
    func setUpUI() {
        artworkImageView.addSubview(titlelabel)
       // artworkImageView.addSubview(loveItButton)
        artworkImageView.addSubview(contentslabel)
        contentView.addSubview(artworkImageView)
        //contentView.backgroundColor = UIColor.red
        artworkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        //artworkImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //artworkImageView.heightAnchor.constraint(equalToConstant: <#T##CGFloat#>)
        artworkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        artworkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        artworkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        contentslabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        contentslabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        contentslabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        titlelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        titlelabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        titlelabel.bottomAnchor.constraint(equalTo: contentslabel.topAnchor, constant: -2).isActive = true
      /*
        loveItButton.trailingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: -8).isActive = true
        loveItButton.topAnchor.constraint(equalTo: artworkImageView.topAnchor, constant: 8).isActive = true
       // titlelabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
*/
        

    }
}

