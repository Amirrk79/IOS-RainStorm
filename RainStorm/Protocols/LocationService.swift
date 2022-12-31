//
//  LocationService.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/28/22.
//

import Foundation


enum LocationServiceError {
    case noAuthorizedToGetLocation
}

enum LocationServiceResult {
    case success(Location)
    case failure(LocationServiceError)
}

protocol LocationService {
    typealias FetchLocationCompletion = (LocationServiceResult) -> Void
    
    func fetchLocation(completion: @escaping FetchLocationCompletion)
}
