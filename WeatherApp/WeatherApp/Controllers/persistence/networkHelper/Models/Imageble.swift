//
//  Imageble.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/22/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation
import UIKit

protocol imageble {
    var imageName: String {get}
    func getImage() -> UIImage
}
 
