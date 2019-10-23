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
        view.backgroundColor = .blue
        addSubView()
        loadData()
        setUpCollectionViewConstraints()
        setTextFieldConstraints()
       
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
    
   private func setTextFieldConstraints() {
       NSLayoutConstraint.activate([
           zipCodeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           zipCodeTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
           zipCodeTextField.widthAnchor.constraint(equalToConstant: 130),
           zipCodeTextField.heightAnchor.constraint(equalToConstant: 35)
       ])
   }
    private func setUpCollectionViewConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                    collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//                   collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                   collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2)
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
        self.view.addSubview(zipCodeTextField)
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }

    }

extension FirstViewController: UITextFieldDelegate {
//    textField.resignFirstResponder()
//    return true
}

func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
        return false
    }
    if range.location == 0 && (string == " ") { return false }
    
    let currentText = textField.text ?? ""
    guard let stringRange = Range(range, in: currentText) else { return false }
    let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
    return updatedText.count <= 5
}

