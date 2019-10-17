//
//  weatherStruct.swift
//  WeatherApp
//
//  Created by Kary Martinez on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import Foundation


struct Weather: Codable {
    
    let daily: DailyWrapper
}

struct DailyWrapper: Codable {
    let data : [DailyDatum]
}

struct DailyDatum: Codable {
    let icon: String
    let temperatureHigh: Double
    let temperatureLow: Double
    let windSpeed: Double
    let precipIntensityMax: Double
    let time: Int
    let sunriseTime: Int
    let sunsetTime: Int
}
