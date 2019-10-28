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
    
    lazy var HighLabel: UILabel = {
        let HighLabel = UILabel()
        self.addSubview(HighLabel)
        return HighLabel
    }()
    
    lazy var LowLabel: UILabel = {
        let LowLabel = UILabel()
        self.addSubview(LowLabel)
        return LowLabel
    }()
    
    
    lazy var imageThing: UIImageView = {
        let imagetapped = UIImageView()
        self.addSubview(imagetapped)
        return imagetapped
    }()
    
    func setImageConstraints() {
        imageThing.translatesAutoresizingMaskIntoConstraints = false
        imageThing.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        imageThing.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageThing.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageThing.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    
    
    private func setConstrains() {
        name.translatesAutoresizingMaskIntoConstraints = false
        [name.centerXAnchor.constraint(equalTo: centerXAnchor), name.centerYAnchor.constraint(equalTo: centerYAnchor), ].forEach{ $0.isActive = true }
    }
    
    
    private func highsetConstrains() {
        HighLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            HighLabel.heightAnchor.constraint(equalToConstant: 55),
            HighLabel.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            HighLabel.trailingAnchor.constraint(lessThanOrEqualTo: name.leadingAnchor, constant: 70),
            HighLabel.topAnchor.constraint(equalTo: name.topAnchor)
        ])
    }
    
    private func LowsetConstrains() {
        LowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            LowLabel.heightAnchor.constraint(equalToConstant: 85),
            LowLabel.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            LowLabel.trailingAnchor.constraint(lessThanOrEqualTo: name.leadingAnchor, constant: 70),
            LowLabel.topAnchor.constraint(equalTo: name.topAnchor)
        ])
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setImageConstraints()
        setConstrains()
        highsetConstrains()
        LowsetConstrains()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
