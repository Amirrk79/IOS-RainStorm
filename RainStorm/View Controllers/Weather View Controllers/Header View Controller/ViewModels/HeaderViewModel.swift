//
//  HeaderViewModel.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/10/22.
//

import Foundation
import UIKit


struct HeaderViewModel {
    let currentWeatherData: CurrentWeatherData
    
    private let dateFormatter = DateFormatter()
    private let dateConverter = DateFormatter()
    
    private func convertStringToDate(string: String) -> Date {
        dateFormatter.dateFormat = Defaults.defaultWatherDateFormat
        return dateFormatter.date(from: string) ?? Date()
    }
    
    var date: String {
        dateConverter.dateFormat = "EEE, MMMM d YYYY"
        
        return dateConverter.string(from: convertStringToDate(string: currentWeatherData.time))
    }
    
    var time: String {
        dateConverter.dateFormat = "hh:mm a"
        
        return dateConverter.string(from: convertStringToDate(string: currentWeatherData.time))
    }
    
    
    var temperature: String {
        return String(format: "%.2f °C", currentWeatherData.temperature)
    }
    
    var windspeed: String {
        return String(format: "%.1f KMH", currentWeatherData.windspeed)
    }
    
    var weatherIcon: UIImage? {
        return UIImage.iconOfWeatherCode(weatherCode: currentWeatherData.weathercode, temperature: currentWeatherData.temperature)
    }
}
