//
//  WeatherService.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit


protocol WeatherServiceProtocol {
    func fetch(_ request: WeatherRequest, completionHandler: @escaping (ResultResponse<NKWeatherCodable>) -> Void)
}

final class WeatherService: WeatherServiceProtocol {
    
    private let networkRequester: NetworkRequester

    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func fetch(_ request: WeatherRequest, completionHandler: @escaping (ResultResponse<NKWeatherCodable>) -> Void) {
        networkRequester.doRequest(request: request, completionHandler: completionHandler)
    }
}
