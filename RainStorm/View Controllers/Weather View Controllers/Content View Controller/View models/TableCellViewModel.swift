//
//  TableCellViewModel.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/25/22.
//

import UIKit

fileprivate func sortDataByDays<SingleData>(data: [SingleData]) -> [Int : [SingleData]] {
        var result: [Int : [SingleData]] = [:]
        var dayDataTemp: [SingleData] = []
    
    data.map({hourData in data
        if dayDataTemp.count < 23 {
            dayDataTemp.append(hourData)
        } else {
            result[result.count + 1] = dayDataTemp
            dayDataTemp = []
        }
    })
    
        return result
}




struct TableCellViewModel {
    
    let hourlyWeatherData: WeatherHourlyData
    let indexOfDay: Int
    
    var sortedTimesByDays: [Int : [String]] {
      return sortDataByDays(data: hourlyWeatherData.time)
    }
    
    var sortedTemperatureByDays: [Int: [Double]] {
        return sortDataByDays(data: hourlyWeatherData.temperature_2m)
    }
    
    var sortedWeatherCodeByDays: [Int: [Int]] {
        return sortDataByDays(data: hourlyWeatherData.weathercode)
    }
        
    let dateFormatter = DateFormatter()
    let dateConverter = DateFormatter()
    
    
    var dayName: String! {
        dateFormatter.dateFormat = Defaults.defaultWatherDateFormat
        dateConverter.dateFormat = "EEEE"
        
        return dateConverter.string(from: dateFormatter.date(from: sortedTimesByDays[indexOfDay]?[1] ?? "") ?? Date())
    }
    
    var dayDate: String {
        dateFormatter.dateFormat = Defaults.defaultWatherDateFormat
        dateConverter.dateFormat = "MMM d, yyyy"
        
        return dateConverter.string(from: dateFormatter.date(from: sortedTimesByDays[indexOfDay]?[1] ?? "") ?? Date())
    }
    
    var dayMaxTemp: String {
        return String(format: "%1.f °C" , sortedTemperatureByDays[indexOfDay]?.max() ?? 0.0)
    }
    
    var dayMinTemp: String {
        return String(format: "%1.f °C" , sortedTemperatureByDays[indexOfDay]?.min() ?? 0.0)
    }
    
    var dayWeatherStatusIcon: UIImage! {
        return UIImage.iconOfWeatherCode(weatherCode: sortedWeatherCodeByDays[indexOfDay]?[1] ?? 1, temperature: 20)
    }
    
    
    
}

extension TableCellViewModel : TableCell {
    
}
