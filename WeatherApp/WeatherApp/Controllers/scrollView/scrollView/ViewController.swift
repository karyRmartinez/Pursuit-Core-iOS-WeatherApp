//
//  ViewController.swift
//  scrollView
//
//  Created by Kary Martinez on 10/17/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
     
        return scroll
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.addSubview(scrollView)
     
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
    }


}

