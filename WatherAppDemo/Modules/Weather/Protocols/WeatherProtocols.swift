//
//  WeatherProtocols.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol WeatherPresenterToViewProtocol: AnyObject {
    func showCurrentWeather()
    func showError()
}

protocol WeatherInteractorToPresenterProtocol: AnyObject {
    func currentWeatherFetched()
    func currentWeatherFetchedFailed()
}

protocol WeatherPresentorToInteractorProtocol: AnyObject {
    var presenter: WeatherInteractorToPresenterProtocol? { get set }
    var weather: NKWeatherCodable? { get set }
    func fetchCurrentWeather(lat:Double, lon:Double)
}

protocol WeatherViewToPresenterProtocol: AnyObject {
    var view: WeatherPresenterToViewProtocol? { get set }
    var interactor: WeatherPresentorToInteractorProtocol? { get set }
    var router: WeatherPresenterToRouterProtocol? { get set }
    
    func updateView(lat:Double, lon:Double)
    func getWeather() -> NKWeatherCodable?
    
    func getWeatherHoursCount() -> Int
    func getWeatherHours(index:Int) -> NKWeatherCurrent?
}

protocol WeatherPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

// Save Days list
protocol WeatherListPresenterToViewProtocol: AnyObject {
    func showCurrentWeather()
    func showError()
}

protocol WeatherListInteractorToPresenterProtocol: AnyObject {
    func currentWeatherFetched()
    func currentWeatherFetchedFailed()
}

protocol WeatherListViewToPresenterProtocol: AnyObject {
    
    var view: WeatherListPresenterToViewProtocol? { get set }
    var interactor: WeatherListPresentorToInteractorProtocol? { get set }
    var router: WeatherListPresenterToRouterProtocol? { get set }
    
    func updateView(lat:Double, lon:Double)
    
    func getWeatherDailyCount() -> Int
    func getWeatherDaily(index:Int) -> NKWeatherDaily?
}

protocol WeatherListPresentorToInteractorProtocol: AnyObject {
    var presenter: WeatherListInteractorToPresenterProtocol? { get set }
    var weather: NKWeatherCodable? { get set }
    func fetchCurrentWeather(lat:Double, lon:Double)
}

protocol WeatherListPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
