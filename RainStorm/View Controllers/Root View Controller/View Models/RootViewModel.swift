//
//  RootViewModel.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/5/22.
//

import Foundation
import UIKit


class RootViewModel: NSObject {
    enum WeatherDataError: Error {
        case noAuthorizedToGetLocation
        case failedToRequestLocation
        case noWeatherDataAvailable
    }
    
    enum WeatherDataResult {
        case success(WeatherData)
        case failure(WeatherDataError)
    }
   typealias FetchWeatherDataCompletion = (WeatherDataResult) -> Void
    
   
    
    var didFetchWeatherData: FetchWeatherDataCompletion?
    
    private let locationService: LocationService
    
    init(locationService: LocationService) {
        self.locationService = locationService
        super.init()
        
        fetchWeatherData(location: Defaults.location)
        
        
        fetchLocation()
        
        setupNotificationHandling()
    }
    
   private func fetchLocation() {
       locationService.fetchLocation { [weak self] (result) in
           switch result {
           case .success(let location):
               self?.fetchWeatherData(location: location)
           case .failure(let error):
               print("unable to fetch location \(String(describing: error))")
               
               let result: WeatherDataResult = .failure(.noAuthorizedToGetLocation)
               self?.didFetchWeatherData?(result)
           }
       }
    }
    
    
    
    private func fetchWeatherData(location: Location) {
        let WeatherRequest = WeatherRequest(baseUrl: WeatherService.BASE_URL, location: location)
        
        URLSession.shared.dataTask(with: WeatherRequest.url, completionHandler: { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    let result: WeatherDataResult = .failure(.noWeatherDataAvailable)
                    
                    self?.didFetchWeatherData?(result)
                } else if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(WeatherResponse.self, from: data)
                        let result: WeatherDataResult = .success(response)
                        
                        self?.didFetchWeatherData?(result)
                    } catch {
                        let result: WeatherDataResult = .failure(.noWeatherDataAvailable)
                        
                        self?.didFetchWeatherData?(result)
                    }
                } else {
                    let result: WeatherDataResult = .failure(.noWeatherDataAvailable)
                    
                    self?.didFetchWeatherData?(result)
                }
                
            }
            
            }).resume()
    }
    
    
    private func setupNotificationHandling() {
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification,
                                               object: nil,
                                               queue: OperationQueue.main) { [weak self] (_) in
            guard let didFetchWeatherData = UserDefaults.didFetchWeatherData else {
                self?.refresh()
                return
            }
           
            if Date().timeIntervalSince(didFetchWeatherData) > Configuration.refreshTreshhold {
            self?.refresh()
            }
            
        }
    }
    
     func refresh() {
        fetchLocation()
    }
                                               
    
}



extension UserDefaults {
    private enum Keys {
        static let didFetchWeatherData = "didFetchWeatherData"
    }
        
        fileprivate class var didFetchWeatherData: Date? {
            get {
                UserDefaults.standard.object(forKey: Keys.didFetchWeatherData) as? Date
            }
            
            set(newValue) {
                UserDefaults.standard.set(newValue, forKey: Keys.didFetchWeatherData)
            }
    }
}
