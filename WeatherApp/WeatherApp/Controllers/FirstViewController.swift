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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let weatherView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        
        weatherView.register(weatherCollectionViewCell.self, forCellWithReuseIdentifier: "weatherCell")
        weatherView.dataSource = self
        weatherView.delegate = self
        weatherView.backgroundColor = .white
        
        
        
        return weatherView
        
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Weather"
        return label
        
    }()
    
    
    
    var weatherForecast = [DailyDatum]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubView()
        loadData()
        setUpCollectionViewConstraints()
        setTextFieldConstraints()
        setlabelConstraints()
        
    }
    lazy var zipCodeTextField: UITextField = {
        let textView = UITextField()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.placeholder = "Enter Zipcode..."
        textView.borderStyle = .line
        textView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textView.delegate = self
        return textView
    }()
    var zipCode = String() {
        didSet {
            loadLatitudeAndLongitude()
        }
    }
    
    var latitude = Double()
    var longitude = Double()
    var name = String() {
        didSet {
            nameLabel.text = name
        }
    }
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            zipCodeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zipCodeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -70),
            zipCodeTextField.widthAnchor.constraint(equalToConstant: 130),
            zipCodeTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func setlabelConstraints() {
          NSLayoutConstraint.activate([
              nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
           nameLabel.widthAnchor.constraint(equalToConstant: 130),
            nameLabel.heightAnchor.constraint(equalToConstant: 35)
          ])
      }
    
    
    private func setUpCollectionViewConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
    
    private func loadData() {
        WeatherAPIClient.manager.getWeather(longitude: longitude, latitude: latitude){ (result) in
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
    
    
    private func loadLatitudeAndLongitude() {
        ZipCodeHelper.getLatLong(fromZipCode: zipCode) { (result) in
            switch result {
            case .success(let zipcodeData):
                self.longitude = zipcodeData.long
                self.latitude = zipcodeData.lat
                self.name = zipcodeData.name
                self.loadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addSubView() {
        self.view.addSubview(collectionView)
        self.view.addSubview(zipCodeTextField)
        self.view.addSubview(nameLabel)
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
        cell.HighLabel.text = "High:\(theweather.temperatureHigh)"
        cell.LowLabel.text = "Low:\(theweather.temperatureLow)"
        cell.imageThing.image = UIImage(named: theweather.icon)
        
        return cell
    }
    
}


extension FirstViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        zipCode = textField.text!
//        loadLatitudeAndLongitude()
    
        return true
    }
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return false
}

