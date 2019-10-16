//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
 
 lazy var tableView: UICollectionView = {
        let weatherView = UICollectionView()
       
    
    weatherView.register(weatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCell")
        return weatherView
    }()
    
    
    
//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds) // takes up all the space in the simulator
//    }
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    private func commonInit() {
//        ViewSetup()
//    }
//    private func ViewSetup() {
//        addSubview(tableView)
//    }
}
