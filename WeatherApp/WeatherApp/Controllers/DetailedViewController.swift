//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    var forecast: DailyDatum?
    var forecastpic: Photo? {
        didSet {
            loadData()
        }
    }
    
    lazy var saveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(self.saveButtonPressed))
        view.backgroundColor = .white
        return button
    }()
    
    
    @objc func saveButtonPressed() {
        
        navigationController?.popViewController(animated: true)
    }
    
    lazy var picImageView: UIImageView = {
        let pic = UIImageView()
        pic.clipsToBounds = true
        pic.contentMode = .scaleAspectFit
        pic.alpha = 1
        pic.backgroundColor = UIColor(white: 0.98, alpha: 1)
        return pic
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = saveButton
        
    }
    
    private func loadData(){
        
    
            }
    }
    

