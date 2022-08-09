//
//  APIPath.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

enum APIPath {
    case weather
    
    var rawValue: String {
        switch self {
        case .weather: return "/data/2.5/onecall"
        }
    }
}
