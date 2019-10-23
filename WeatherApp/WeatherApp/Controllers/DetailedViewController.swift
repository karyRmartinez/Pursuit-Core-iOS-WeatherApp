//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var forecast: DailyDatum? {
        didSet {
            
        }
    }
    lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveButtonPressed))
        view.backgroundColor = .white
        return button
    }()
    
    
    @objc func saveButtonPressed() {

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}
