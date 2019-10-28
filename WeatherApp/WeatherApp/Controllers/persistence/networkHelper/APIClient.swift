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
    
    func getWeather(longitude: Double, latitude: Double, completionHandler: @escaping (Result<[DailyDatum], AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: URL(string: "https://api.darksky.net/forecast/f7ccd9076b709bd3b3da0992466811b7/\(latitude),\(longitude)")!, andMethod: .get) { (result) in
            switch result {
            case .failure(let error) :
                completionHandler(.failure(error))
            case .success(let data):
                do {
                    let WeatherInfo = try JSONDecoder().decode(Weather.self, from: data)
                    completionHandler(.success(WeatherInfo.daily.data))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                    

                }
            }
        }
    }
    
//    private var WeatherUrl: URL {
//        guard let url = URL(string: ) else {
//            fatalError("Invalid URL")
//        }
//        return url
//    }
    
    private init() {}
}

