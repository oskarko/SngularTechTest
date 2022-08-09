//
//  WeatherDayTVC.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherDayTVC: UITableViewCell {
    
    @IBOutlet private weak var lblDate:UILabel?
    @IBOutlet private weak var imgWeathe:UIImageView?
    @IBOutlet private weak var lblWeatherType:UILabel?
    @IBOutlet private weak var lblTemperature:UILabel?

    var data:NKWeatherDaily? {
        didSet {
            let date = data?.dt?.asDate
            if date?.isToday == true {
                lblDate?.text = "Today"
            } else {
                lblDate?.text = data?.dt?.asDateDayOnly ?? "N/A"
            }
            imgWeathe?.setImageUrl(data?.weather?.first?.icon?.asWeatherIcon)
            lblWeatherType?.text = data?.weather?.first?.main ?? "N/A"
            lblTemperature?.text = "\(Int(data?.temp?.min ?? 0))° - \(Int(data?.temp?.max ?? 0))°"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        selectionStyle = .none
    }
}
