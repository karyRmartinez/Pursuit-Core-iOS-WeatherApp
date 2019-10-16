//
//  APIClient.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct WeatherAPIClient {
    static let manager = WeatherAPIClient()
    
    func getWeather(completionHandler: @escaping (Result<Weather, AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: WeatherUrl, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let WeatherInfo = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(WeatherInfo))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                    

                }
            }
        }
    }
    
    private var WeatherUrl: URL {
        guard let url = URL(string: "https://api.darksky.net/forecast/f7ccd9076b709bd3b3da0992466811b7/40.7128,-74.0060") else {
            fatalError("Invalid URL")
        }
        return url
    }
    
    private init() {}
}

