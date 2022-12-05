//
//  WeatherRequest.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/4/22.
//

import Foundation
import CoreLocation

struct WeatherRequest {
    let baseUrl: URL
    
    let location: CLLocation
    
    var latitude: Double {
        return location.coordinate.latitude
    }
    var longitude: Double {
       return location.coordinate.longitude
    }
    
    var url: URL {
        return baseUrl.appending(queryItems: [URLQueryItem(name: "latitude", value: "\(latitude)"), URLQueryItem(name: "longitude", value: "\(longitude)")])
    }
}
