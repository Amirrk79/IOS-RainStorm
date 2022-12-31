//
//  ContentTableViewCell.swift
//  RainStorm
//
//  Created by Amir hossein kazemi seresht on 12/18/22.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBOutlet var dayNameLabel: UILabel! {
        didSet {
            dayNameLabel.font = UIFont.heavyLarge
            dayNameLabel.textColor = UIColor.base
        }
    }
    
    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.lightSmall
        }
    }
    
    @IBOutlet var minTempLabel: UILabel! {
        didSet {
            minTempLabel.font = UIFont.lightRegular
        }
    }
    
    @IBOutlet var maxTempLabel: UILabel! {
        didSet {
            maxTempLabel.font = UIFont.lightRegular
        }
    }
    
    @IBOutlet var weatherStatusIcon: UIImageView! {
        didSet {
            weatherStatusIcon.contentMode = .scaleAspectFit
            weatherStatusIcon.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func configureContentTableCell(viewModel: TableCell) {
        dayNameLabel.text = viewModel.dayName
        dateLabel.text = viewModel.dayDate
        minTempLabel.text = "Min: \(viewModel.dayMinTemp)"
        maxTempLabel.text = "Max: \(viewModel.dayMaxTemp)"
        weatherStatusIcon.image = viewModel.dayWeatherStatusIcon
    }
    
}
