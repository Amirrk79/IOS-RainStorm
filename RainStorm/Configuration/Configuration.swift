//
//  Configuration.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/4/22.
//

import Foundation

enum Defaults {
    static let location = Location(latitude: 37.335114, longitude: -122.008928)
    static let defaultWatherDateFormat = "yyyy-MM-dd'T'HH:mm"
}


enum WeatherService {
    static let BASE_URL = URL(string: "https://api.open-meteo.com/v1/forecast")!
}


enum Configuration {
    static var refreshTreshhold: TimeInterval {
        #if DEBUG
        return 60.0
        #else
        return 10.0 * 60.0
        #endif
    }
}
