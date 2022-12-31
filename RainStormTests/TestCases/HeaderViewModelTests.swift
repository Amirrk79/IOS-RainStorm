//
//  HeaderViewModelTests.swift
//  RainStormTests
//
//  Created by Amir hossein kazemi seresht on 12/17/22.
//

import XCTest
@testable import RainStorm

final class HeaderViewModelTests: XCTestCase {
    
    var headerViewModel: HeaderViewModel!

    override func setUp() {
        super.setUp()
        
        let data = loadStub(name: "weatherResponse", extension: "json")
        
        let decoder = JSONDecoder()
        
        let weatherResponse = try! decoder.decode(WeatherResponse.self, from: data)
        
        headerViewModel = HeaderViewModel(currentWeatherData: weatherResponse.current_weather)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testDate() {
        XCTAssertEqual(headerViewModel.date, "Sat, December 17 2022")
    }
    
    func testTime() {
        XCTAssertEqual(headerViewModel.time, "10:00 AM")
    }
    
    func testTemperature() {
        XCTAssertEqual(headerViewModel.temperature, "3.20 °C")
    }
    
    func testWindspeed() {
        XCTAssertEqual(headerViewModel.windspeed, "7.0 KMH")
    }
    
    func testWeatherIcon() {
        let weatherIcon = headerViewModel.weatherIcon
        
        XCTAssertNotNil(weatherIcon)
    }
}
