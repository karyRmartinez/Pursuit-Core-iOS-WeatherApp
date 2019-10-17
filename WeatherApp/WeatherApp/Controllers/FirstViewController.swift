//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    var WeatherView = collectionViewView()
    
    var currentWeather = [Weather]() {
        didSet {
            WeatherView.tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        setDelegations()
        addSubView()
        // Do any additional setup after loading the view.
    }
    
    
    func setDelegations() {
        WeatherView.tableView.delegate = self
       WeatherView.tableView.dataSource = self
    }
    

    func getUsData() {
        WeatherAPIManager.shared.getWeather { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                self.currentWeather = [data]

            }
        }
    }
    
    func addSubView() {
        self.view.addSubview(WeatherView.tableView)
    }
    
}

extension FirstViewController: UICollectionViewDelegate {
    
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? weatherCollectionViewCell else { return UICollectionViewCell() }
        var theweather = currentWeather[indexPath.row]
        cell.name.text = currentWeather.description
        return cell
    }
    
}


