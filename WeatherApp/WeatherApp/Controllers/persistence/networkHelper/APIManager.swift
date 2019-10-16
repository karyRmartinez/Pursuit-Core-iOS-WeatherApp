//
//  APIManager.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation


class WeatherAPIManager {
    private init() {}
    
    static let shared = WeatherAPIManager()
    
    func getElements(completionHandler: @escaping (Result<Weather, AppError>) -> Void) {
        let urlStr = "https://api.darksky.net/forecast/f7ccd9076b709bd3b3da0992466811b7/40.7128,-74.0060"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(.badURL))
            return
        }
        
      
    }
}
