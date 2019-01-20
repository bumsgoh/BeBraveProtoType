//
//  DetailViewController.swift
//  BeBraveProtoType
//
//  Created by bumslap on 21/01/2019.
//  Copyright © 2019 bumslap. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let artworkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "cat1")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.textColor = .white
        label.text = "Lorem Ipsum"
        return label
    }()
    
    let contentslabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "consectetur adipiscing elit, sed"
        label.textColor = .white
        return label
    }()
    
    let introView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.white
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    

    func setUpUI() {
        
        view.addSubview(artworkImageView)
        artworkImageView.addSubview(artistNameLabel)
        artworkImageView.addSubview(contentslabel)
        view.addSubview(introView)
        
        
        artworkImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        artworkImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //artworkImageView.bottomAnchor.constraint(equalTo: view.topAnchor).isActive = true
        artworkImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        artworkImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        
        contentslabel.bottomAnchor.constraint(equalTo: introView.topAnchor, constant: -12).isActive = true
        contentslabel.leadingAnchor.constraint(equalTo: artworkImageView.leadingAnchor, constant: 12).isActive = true
        contentslabel.trailingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: -8).isActive = true
        
        artistNameLabel.leadingAnchor.constraint(equalTo: artworkImageView.leadingAnchor, constant: 12).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: artworkImageView.trailingAnchor, constant: -8).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: contentslabel.topAnchor, constant: -2).isActive = true
        
        introView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        introView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        introView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        introView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35).isActive = true
        
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
