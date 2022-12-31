//
//  WeatherResponse.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/7/22.
//

import Foundation

 struct WeatherResponse: Codable {
     let latitude: Double
     let longitude: Double
    
    struct hourlyData: Codable {
        let time: [String]
        let temperature_2m: [Double]
        let windspeed_10m: [Double]
        let weathercode: [Int]
    }
    let hourly: hourlyData
    
    struct hourlyUnits: Codable {
        let temperature_2m: String
    }
    
    let hourly_units: hourlyUnits
     
     struct currentWeather: Codable {
         let temperature: Double
         let windspeed: Double
         let time: String
         let weathercode: Int
     }
     
     let current_weather: currentWeather
     
}

extension WeatherResponse: WeatherData {
    
    var hourlyData: WeatherHourlyData {
        return hourly
    }
    
    var hourlyUnitsData: WeatherHourlyUnits {
        return hourly_units
    }
    
    var currentWeatherData: CurrentWeatherData {
        return current_weather
    }
    
}

extension WeatherResponse.hourlyData: WeatherHourlyData {
    
    
}

extension WeatherResponse.hourlyUnits: WeatherHourlyUnits {
    
}


extension WeatherResponse.currentWeather: CurrentWeatherData {
    
}
