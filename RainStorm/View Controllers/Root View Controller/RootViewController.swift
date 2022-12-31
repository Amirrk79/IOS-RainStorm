//
//  ViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit


class RootViewController: UIViewController {
    
    private enum AlertType {
        case noAuthorizedToGetLocation
        case failedToRequestLocation
        case noWeatherDataAvailable
    }
    
    var viewModel: RootViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(viewModel: viewModel)
        }
    }
    
    private func setupViewModel(viewModel: RootViewModel) {
        viewModel.didFetchWeatherData = { [weak self] (result) in
            switch result {
            case .failure(let error):
                let alertType: AlertType
                
                switch error {
                case .noAuthorizedToGetLocation:
                    alertType = .noAuthorizedToGetLocation
                case .noWeatherDataAvailable:
                    alertType = .noWeatherDataAvailable
                case .failedToRequestLocation:
                    alertType = .failedToRequestLocation
                }
                
                self?.showAlert(alertType: alertType)
                
            case .success(let data):
                let headerViewModel = HeaderViewModel(currentWeatherData: data.currentWeatherData)
                let contentViewModel = ContentViewModel(hourlyWeatherData: data.hourlyData)
                
                self?.headerViewController.viewModel = headerViewModel
                self?.contentViewController.viewModel = contentViewModel
                
            }
            
        }
    }
    
    private func showAlert(alertType: AlertType) {
        var alertMessage: String
        var alertTitle: String
        
        switch alertType {
        case .noAuthorizedToGetLocation:
            alertTitle = "Unable to Fetch Weather Data for Your Location"
            alertMessage = "Rainstorm is not authorized to access your current location"
        case .noWeatherDataAvailable:
            alertTitle = "Unable to Fetch Weather Data"
            alertMessage = "The application is unable to fetch weather data. Please make sure your device is connected over Wi-Fi or cellular."
        case .failedToRequestLocation:
            alertTitle = "Unable to Fetch Weather Data"
            alertMessage = "Rainstorm is not able to fetch your current location due to a technical issue."
        }
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let alertCancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertCancelAction)
        DispatchQueue.main.async {
        self.present(alertController, animated: true)
        }
    }
    
    private let headerViewController: HeaderViewController = {
        guard let headerViewController = UIStoryboard.main.instantiateViewController(withIdentifier: HeaderViewController.storyboardIndentifier) as? HeaderViewController else {
           fatalError("Failed to instantiate DayViewController")
        }
        
        // configure header view controller
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return headerViewController
    }()
    
    private lazy var contentViewController: ContentViewController = {
        guard let contentViewController = UIStoryboard.main.instantiateViewController(withIdentifier: ContentViewController.storyboardIndentifier) as? ContentViewController else {
            fatalError("Failed to instantiate WeakViewController")
        }
        
        // configure content view controller
        contentViewController.delegate = self
        contentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return contentViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupChildViewControllers()
        //print(viewModel ?? "nothing to show here")
        viewModel?.refresh()
    }

    private func setupChildViewControllers() {
        addChild(headerViewController)
        addChild(contentViewController)
        
        view.addSubview(headerViewController.view)
        view.addSubview(contentViewController.view)
        
        headerViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        headerViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        contentViewController.view.topAnchor.constraint(equalTo: headerViewController.view.bottomAnchor).isActive = true
        contentViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }

}


extension RootViewController: ContentViewControllerDelegate {
    func controllerDidRefresh(_ controller: ContentViewController) {
        viewModel?.refresh()
    }
}

//extension RootViewController {
//    fileprivate enum Layout {
//        enum DayView {
//            static let height: CGFloat = 200.0
//        }
//    }
//}
