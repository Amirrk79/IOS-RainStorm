//
//  TableCell.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/27/22.
//

import UIKit


protocol TableCell {
    var hourlyWeatherData: WeatherHourlyData {get}
    
    var indexOfDay: Int {get}
    
    var sortedTimesByDays: [Int : [String]] {get}
    
    var sortedTemperatureByDays: [Int: [Double]] {get}
    
    var sortedWeatherCodeByDays: [Int: [Int]] {get}
    
    var dayName: String! {get}
    
    var dayDate: String {get}
    
    var dayMaxTemp: String {get}
    
    var dayMinTemp: String {get}
    
    var dayWeatherStatusIcon: UIImage! {get}
}
