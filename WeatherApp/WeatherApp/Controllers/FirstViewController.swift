//
//  FirstViewController.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
        
    lazy var collectionView: UICollectionView = {
        let weatherView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
        
        weatherView.register(weatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCell")
        weatherView.dataSource = self
        weatherView.backgroundColor = .red
        return weatherView
      
    }()
        
    var weatherForecast = [DailyDatum]() {
        didSet {
           collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubView()
        loadData()
        setUpCollectionViewConstraints()
        
        // Do any additional setup after loading the view.
    }
 
    private func setUpCollectionViewConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
       collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
       collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
       collectionView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    private func loadData() {
        WeatherAPIClient.manager.getWeather{ (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let WeatherFromOnline):
                    dump(WeatherFromOnline)
                    self.weatherForecast = WeatherFromOnline
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func addSubView() {
        self.view.addSubview(collectionView)

    }
    
}

extension FirstViewController: UICollectionViewDelegate {
    
}

extension FirstViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "weatherCell", for: indexPath) as? weatherCollectionViewCell else { return UICollectionViewCell() }
        let theweather = weatherForecast[indexPath.row]
        cell.name.text = "\(theweather.icon)"
        return cell
    }
    
}


extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120 , height: 120)
    }
}
