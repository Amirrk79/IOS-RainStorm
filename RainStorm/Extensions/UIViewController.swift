//
//  UIViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit

extension UIViewController {
    // MARK: - Static properties
    
    static var storyboardIndentifier: String {
        return String(describing: self)
    }
}
