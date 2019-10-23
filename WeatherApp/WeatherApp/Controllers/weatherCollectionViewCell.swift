//
//  weatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class weatherCollectionViewCell: UICollectionViewCell {
    
    lazy var name: UILabel = {
        let name = UILabel()
        self.addSubview(name)
        return name
    }()
    
    lazy var imageThing: UIImageView = {
        let imagetapped = UIImageView()
        self.addSubview(imagetapped)
        return imagetapped
    }()
 
    func setImageConstraints() {
         imageThing.translatesAutoresizingMaskIntoConstraints = false
         imageThing.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
         imageThing.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80).isActive = true
       imageThing.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 80).isActive = true
         imageThing.bottomAnchor.constraint(equalTo: self.centerYAnchor , constant: 100).isActive = true
     }
    
    
 

    private func setConstrains() {
        name.translatesAutoresizingMaskIntoConstraints = false
        [name.centerXAnchor.constraint(equalTo: centerXAnchor), name.centerYAnchor.constraint(equalTo: centerYAnchor), ].forEach{ $0.isActive = true }
    }
    
 
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setImageConstraints()
        setConstrains()
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


