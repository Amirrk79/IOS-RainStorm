//
//  Configuration.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/4/22.
//

import Foundation
import CoreLocation

enum Defaults {
    static let location = CLLocation(latitude: 37.335114, longitude: -122.008928)
}
enum WeatherService {
    static let BASE_URL = URL(string: "https://api.open-meteo.com/v1/forecast")!
}
