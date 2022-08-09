//
//  WeatherListPresenter.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherListPresenter: WeatherListViewToPresenterProtocol {
    
    weak var view: WeatherListPresenterToViewProtocol?
    var interactor: WeatherListPresentorToInteractorProtocol?
    var router: WeatherListPresenterToRouterProtocol?
    
    func updateView(lat:Double, lon:Double) {
        interactor?.fetchCurrentWeather(lat: lat, lon: lon)
    }
    
    func getWeatherDailyCount() -> Int {
        interactor?.weather?.daily?.count ?? 0
    }
    
    func getWeatherDaily(index: Int) -> NKWeatherDaily? {
        interactor?.weather?.daily?[index]
    }
}

extension WeatherListPresenter: WeatherListInteractorToPresenterProtocol {
    func currentWeatherFetched() {
        view?.showCurrentWeather()
    }
    
    func currentWeatherFetchedFailed() {
        view?.showError()
    }
}
