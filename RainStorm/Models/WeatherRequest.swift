//
//  WeatherRequest.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/4/22.
//

import Foundation

struct WeatherRequest {
    let baseUrl: URL
    
    let location: Location
    
    var latitude: Double {
        return location.latitude
    }
    var longitude: Double {
       return location.longitude
    }
    
    var url: URL {
        return baseUrl.appending(queryItems: [URLQueryItem(name: "latitude", value: "\(latitude)"), URLQueryItem(name: "longitude", value: "\(longitude)"), URLQueryItem(name: "hourly", value: "temperature_2m,windspeed_10m,weathercode"), URLQueryItem(name: "current_weather", value: "true")])
    }
}
