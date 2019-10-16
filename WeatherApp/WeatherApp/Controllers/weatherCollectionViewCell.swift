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
        return name
    }()
    
    
    private func setConstrains() {
        name.translatesAutoresizingMaskIntoConstraints = false
        [name.centerXAnchor.constraint(equalTo: centerXAnchor), name.centerYAnchor.constraint(equalTo: centerYAnchor)].forEach{ $0.isActive = true }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
