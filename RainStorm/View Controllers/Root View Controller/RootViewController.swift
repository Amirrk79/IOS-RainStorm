//
//  ViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit

class RootViewController: UIViewController {
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIndentifier) as? DayViewController else {
           fatalError("Failed to instantiate DayViewController")
        }
        
        // configure day view controller
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weakViewController: WeakViewController = {
        guard let weakViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeakViewController.storyboardIndentifier) as? WeakViewController else {
            fatalError("Failed to instantiate WeakViewController")
        }
        
        // configure weak view controller
        weakViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weakViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupChildViewControllers()
        fetchWeatherData()
    }

    private func setupChildViewControllers() {
        addChild(dayViewController)
        addChild(weakViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weakViewController.view)
        
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.DayView.height).isActive = true
        
        weakViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weakViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weakViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weakViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    private func fetchWeatherData() {
       
        
        let weatherReq = WeatherRequest(baseUrl: WeatherService.BASE_URL, location: Defaults.location)
        
        URLSession.shared.dataTask(with: weatherReq.url, completionHandler: {(data, response, error) in
            if let error = error {
                print("Request has been failed cause \(error)")
            } else if let response = response {
                print(response)
            }
        }).resume()
    }

}


extension RootViewController {
    fileprivate enum Layout {
        enum DayView {
            static let height: CGFloat = 200.0
        }
    }
}
