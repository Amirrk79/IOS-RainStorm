//
//  ContentViewModelTests.swift
//  RainStormTests
//
//  Created by Amir hossein kazemi seresht on 12/27/22.
//

import XCTest

@testable import RainStorm

final class TableCellViewModelTests: XCTestCase {

    var tableCellViewModel: TableCellViewModel!
    
    override func setUp() {
        super.setUp()
        
        
    let data = loadStub(name: "weatherResponse", extension: "json")
       
        let decoder = JSONDecoder()
        
        let weatherResponse = try! decoder.decode(WeatherResponse.self, from: data)
        
        tableCellViewModel = TableCellViewModel(hourlyWeatherData: weatherResponse.hourlyData, indexOfDay: 1)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDayName() {
        XCTAssertEqual(tableCellViewModel.dayName, "Saturday")
    }
    
    func testDayDate() {
        XCTAssertEqual(tableCellViewModel.dayDate, "Dec 17, 2022")
    }
    
    
    func testDayMinTemp() {
        XCTAssertEqual(tableCellViewModel.dayMinTemp, "2 °C")
    }
    func testDayMaxTemp() {
        XCTAssertEqual(tableCellViewModel.dayMaxTemp, "14 °C")
    }
    
    
    
    func testWeatehrStatusIcon() {
        XCTAssertNotNil(tableCellViewModel.dayWeatherStatusIcon)
    }
    
    
    

}
