//
//  ViewController.swift
//  nytimessafetynet
//
//  Created by Kary Martinez on 10/18/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical
           
           let favoriteView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
         
           return favoriteView
         
       }()
    func presentActionSheet(id: Int) {
          let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
          
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
          
          let shareAction = UIAlertAction(title: "see on Amazon", style: .default, handler: nil)
          
          let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
          
          actionSheet.addAction(cancelAction)
          actionSheet.addAction(shareAction)
          actionSheet.addAction(deleteAction)
          
          present(actionSheet, animated: true, completion: nil) //This actually presents the actionSheet. Otherwise, it won't ever show.
          
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }


}

