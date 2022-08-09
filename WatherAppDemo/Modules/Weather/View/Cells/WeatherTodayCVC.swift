//
//  WatherTodayCVC.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherTodayCVC: UICollectionViewCell {
    
    @IBOutlet var lblTime:UILabel!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var lblTemprature:UILabel!
    
    var data:NKWeatherCurrent? {
        didSet {
            lblTime.text = data?.dt?.asTimeOnly
            imgView.setImageUrl(data?.weather?.first?.icon?.asWeatherIcon)
            lblTemprature.text = "\(Int(data?.temp ?? 0))°"
        }
    }
}
