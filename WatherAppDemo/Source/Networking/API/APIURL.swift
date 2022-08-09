//
//  APIURL.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

enum APIURL: String {
    #if DEBUG
    case baseURL = "https://api.openweathermap.org"
    #else
    case baseURL = "https://api.openweathermap.org"
    #endif

    var convertedURL: URL {
        guard let url = URL(string: rawValue) else {
            assertionFailure("Incorrect format of URL")
            return URL(string: "")!
        }
        
        return url
    }
}
