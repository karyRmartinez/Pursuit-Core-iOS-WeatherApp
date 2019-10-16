//
//  weatherStruct.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation


struct Weather: Codable {
    let latitude: Double
    let longitude: Double
    let timezone: String
    let currently: [currentlyWrapper]
    
}

struct currentlyWrapper: Codable {
    let time: Int
    let summary: String
    let icon: String
    let nearestStormDistance: Int?
    let precipIntensity: Double
    let precipIntensityError: Double?
    let precipProbability: Double
    let precipType: String?
    let temperature, apparentTemperature, dewPoint, humidity: Double
    let pressure, windSpeed, windGust: Double
    let windBearing: Int
    let cloudCover: Double
    let uvIndex: Int
    let visibility, ozone: Double
}
