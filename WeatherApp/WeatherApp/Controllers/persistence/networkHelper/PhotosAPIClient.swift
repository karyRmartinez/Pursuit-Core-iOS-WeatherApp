//
//  PhotosAPIClient.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/23/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation

struct PhotosAPIClient {
    static let manager = PhotosAPIClient()
    
    func getWeather(completionHandler: @escaping (Result<[DailyDatum], AppError>) -> ()) {
        NetworkHelper.manager.performDataTask(withUrl: pixalBayUrl, andMethod: .get) { (result) in
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
    
    private var pixalBayUrl: URL {
        guard let url = URL(string: "https://pixabay.com/api/?key=13797159-8c9316d9a7c212a7922ef5ba3") else {
            fatalError("Invalid URL")
        }
        return url
    }
    
    private init() {}
}
