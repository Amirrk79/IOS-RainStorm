//
//  LocationManager.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/28/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, LocationService {
    
    private var didFetchLocation: FetchLocationCompletion?

    
    func fetchLocation(completion: @escaping LocationService.FetchLocationCompletion) {
        didFetchLocation = completion
        
        locationManager.requestLocation()
    }
    
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        
        locationManager.delegate = self
        
        return locationManager
    }()
}



extension LocationManager: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let result: LocationServiceResult = .success(Location(location: location))
        
        didFetchLocation?(result)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        } else {
            let result: LocationServiceResult = .failure(.noAuthorizedToGetLocation)
            
            didFetchLocation?(result)
            
            didFetchLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location cause \(error)")
    }
}


fileprivate extension Location {
    init (location: CLLocation) {
        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude
    }
}
