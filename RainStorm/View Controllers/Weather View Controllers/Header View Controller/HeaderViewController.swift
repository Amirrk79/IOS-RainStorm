//
//  DayViewController.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/3/22.
//

import UIKit

final class HeaderViewController: UIViewController {

    var viewModel: HeaderViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(viewModel: viewModel)
        }
    }
    
    
    // UI Elements
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = .base
            dateLabel.font = .heavyLarge
        }
    }
    
    @IBOutlet var timeLabel: UILabel! {
        didSet {
            timeLabel.textColor = .black
            timeLabel.font = .lightSmall
        }
    }
    
    @IBOutlet var temperatureLabel: UILabel! {
        didSet {
            temperatureLabel.textColor = .black
            temperatureLabel.font = .lightRegular
        }
    }
    
    @IBOutlet var windspeedLabel: UILabel! {
        didSet {
            windspeedLabel.textColor = .black
            windspeedLabel.font = .lightRegular
        }
    }
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
            iconImageView.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    //loading
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.startAnimating()
            activityIndicatorView.hidesWhenStopped = true
        }
    }
   
    //hide views when no data is available to show
    
    @IBOutlet var headerViews: [UIView]! {
        didSet {
            for view in headerViews {
                view.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //setup  view
        setupView()
    }
    
    private func setupView() {
        //configure view
        view.backgroundColor = .systemGray6
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
private func setupViewModel(viewModel: HeaderViewModel) {
    
    activityIndicatorView.stopAnimating()
    
    dateLabel.text = viewModel.date
    timeLabel.text = viewModel.time
    temperatureLabel.text = viewModel.temperature
    windspeedLabel.text = viewModel.windspeed
    
    iconImageView.image = viewModel.weatherIcon
  
    
    for view in headerViews {
        view.isHidden = false
    }
    
    }
}
