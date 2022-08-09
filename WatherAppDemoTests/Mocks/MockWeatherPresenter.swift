//
//  MockWeatherPresenter.swift
//  WatherAppDemoTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

@testable import WatherAppDemo
import UIKit

class MockWeatherPresenter: WeatherViewToPresenterProtocol {
    var view: WeatherPresenterToViewProtocol?
    var interactor: WeatherPresentorToInteractorProtocol?
    var router: WeatherPresenterToRouterProtocol?
    
    func updateView(lat: Double, lon: Double) {
        interactor?.fetchCurrentWeather(lat: lat, lon: lon)
    }
    
    func getWeather() -> NKWeatherCodable? {
        return interactor?.weather
    }
    
    func getWeatherHoursCount() -> Int {
        return interactor?.weather?.hourly?.count ?? 0
    }
    
    func getWeatherHours(index: Int) -> NKWeatherCurrent? {
        return interactor?.weather?.hourly?[index]
    }
    
    var isActivityIndicatorDismissed = false
    var isCurrentWeatherFetched = false
    var isCurrentWeatherFetchedFailed = false
}

extension MockWeatherPresenter: WeatherInteractorToPresenterProtocol {
    func currentWeatherFetched() {
        isActivityIndicatorDismissed = true
        isCurrentWeatherFetched = true
    }
    
    func currentWeatherFetchedFailed() {
        isActivityIndicatorDismissed = true
        isCurrentWeatherFetchedFailed = true
    }
}
