//
//  ContentViewModel.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/18/22.
//

import Foundation

struct ContentViewModel {
    let hourlyWeatherData: WeatherHourlyData
    
    var numberOfDays: Int {
      return hourlyWeatherData.time.count / 24
    }
    
    func tableCellViewModel(indexOfDay: Int) -> TableCellViewModel {
        return TableCellViewModel(hourlyWeatherData: hourlyWeatherData, indexOfDay: indexOfDay)
    }
}
