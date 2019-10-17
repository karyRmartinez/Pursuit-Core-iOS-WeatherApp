//
//  collectionViewView.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class collectionViewView: UIView {
    
    lazy var tableView: UICollectionView = {
           let weatherView = UICollectionView()
          
       
       weatherView.register(weatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCell")
           return weatherView
       }()
       

}
