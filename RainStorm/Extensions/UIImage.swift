//
//  UIImage.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/14/22.
//

import UIKit


extension UIImage {
    class func iconOfWeatherCode(weatherCode: Int, temperature: Double) -> UIImage? {
        switch weatherCode {
        case 0:
            if temperature == 0 || temperature < 0 {
                return UIImage(named: "freezing")
            } else if temperature > 30 {
                return UIImage(named: "overheat")
            } else {
                return UIImage(named: "clear")
            }
        case 1,2:
            return UIImage(named: "partly-cloudy")
        case 3:
            return UIImage(named: "overcast")
        case 61,63,65:
            return UIImage(named: "rain")
        case 66,67:
            return UIImage(named: "freazing-rain")
        case 71,73,75,77,85,86:
            return UIImage(named: "snow")
        case 80,81,82:
            return UIImage(named: "heavy-rain")
        case 95:
            return UIImage(named: "thunderstorm")
        case 96,99:
            return UIImage(named: "thunderstorm-heavy")
        default:
            return UIImage(named: "clear")
        }
    }
}
