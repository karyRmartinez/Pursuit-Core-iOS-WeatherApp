//
//  FavoritesCollectionViewCell.swift
//  nytimessafetynet
//
//  Created by Kary Martinez on 10/21/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    lazy var TextViewDescription: UITextView = {
          let textDescription = UITextView()
          textDescription.text = "Description"
          textDescription.textColor = .black
          textDescription.font = .italicSystemFont(ofSize: 14)
          textDescription.isScrollEnabled = true
          textDescription.isSelectable = false
          textDescription.isEditable = false
          
          return textDescription
      }()
    func setTextViewConstraint() {
         addSubview(TextViewDescription)
         
         TextViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
         TextViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0).isActive = true
         TextViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
         
     }
}
