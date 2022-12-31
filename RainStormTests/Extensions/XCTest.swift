//
//  XCTest.swift
//  RainStormTests
//
//  Created by Amir hossein kazemi seresht on 12/17/22.
//

import XCTest

extension XCTestCase {
    func loadStub(name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
