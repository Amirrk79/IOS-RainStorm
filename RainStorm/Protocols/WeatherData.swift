//
//  WeatherResponse.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/10/22.
//


protocol WeatherData {
    var latitude: Double {get}
    var longitude: Double {get}
    var hourlyData: WeatherHourlyData {get}
    var hourlyUnitsData: WeatherHourlyUnits {get}
    var currentWeatherData: CurrentWeatherData {get}
}

protocol WeatherHourlyData {
    var time: [String] {get}
    var temperature_2m: [Double] {get}
    var windspeed_10m: [Double] {get}
    var weathercode: [Int] {get}
}

protocol WeatherHourlyUnits {
    var temperature_2m: String {get}
}

protocol CurrentWeatherData {
    var temperature: Double {get}
    var windspeed: Double {get}
    var time: String {get}
    var weathercode: Int {get}
}
