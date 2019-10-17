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
    let daily: [DailyWrapper]
    
}

struct DailyWrapper: Codable {
    let summary:String
    let Icon: String
    let data : [DailyDatum]
}

struct DailyDatum: Codable {
        let time: Int
      let summary, icon: String
      let sunriseTime, sunsetTime: Int
      let moonPhase, precipIntensity, precipIntensityMax: Double
      let precipIntensityMaxTime: Int
      let precipProbability: Double
      let precipType: String
      let temperatureHigh: Double
      let temperatureHighTime: Int
      let temperatureLow: Double
      let temperatureLowTime: Int
      let apparentTemperatureHigh: Double
      let apparentTemperatureHighTime: Int
      let apparentTemperatureLow: Double
      let apparentTemperatureLowTime: Int
      let dewPoint, humidity, pressure, windSpeed: Double
      let windGust: Double
      let windGustTime, windBearing: Int
      let cloudCover: Double
      let uvIndex, uvIndexTime: Int
      let visibility, ozone, temperatureMin: Double
      let temperatureMinTime: Int
      let temperatureMax: Double
      let temperatureMaxTime: Int
      let apparentTemperatureMin: Double
      let apparentTemperatureMinTime: Int
      let apparentTemperatureMax: Double
      let apparentTemperatureMaxTime: Int
}
