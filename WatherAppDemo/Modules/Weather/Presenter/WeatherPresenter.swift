//
//  WeatherPresenter.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherPresenter: WeatherViewToPresenterProtocol {
    
    weak var view: WeatherPresenterToViewProtocol?
    var interactor: WeatherPresentorToInteractorProtocol?
    var router: WeatherPresenterToRouterProtocol?
    
    func updateView(lat:Double, lon:Double) {
        interactor?.fetchCurrentWeather(lat: lat, lon: lon)
    }
    
    func getWeather() -> NKWeatherCodable? {
        return interactor?.weather
    }
    
    func getWeatherHoursCount() -> Int {
        interactor?.weather?.hourly?.count ?? 0
    }
    
    func getWeatherHours(index: Int) -> NKWeatherCurrent? {
        interactor?.weather?.hourly?[index]
    }
}

extension WeatherPresenter: WeatherInteractorToPresenterProtocol {
    func currentWeatherFetched() {
        view?.showCurrentWeather()
    }
    
    func currentWeatherFetchedFailed() {
        view?.showError()
    }
}
