//
//  WeatherInteractor.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherInteractor: WeatherPresentorToInteractorProtocol {
    
    weak var presenter: WeatherInteractorToPresenterProtocol?
    var weather: NKWeatherCodable?
    
    private let service: WeatherServiceProtocol = WeatherService()
    
    func fetchCurrentWeather(lat:Double, lon:Double) {
        let model = WeatherRequestModel(lat: "\(lat)", lon: "\(lon)")
        
        service.fetch(WeatherRequest.weather(model)) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case let .success(response):
                    self.weather = response
                    self.presenter?.currentWeatherFetched()
                case let .failure(error):
                    print(error.message ?? "--")
                    self.presenter?.currentWeatherFetchedFailed()
                }
            }
        }
    }
}
