//
//  WeatherListModelTests.swift
//  WatherAppDemoTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import WatherAppDemo

class WeatherListModelTests: XCTestCase {

    var view:WeatherSevenDaysListVC!
    var presenter: (WeatherListViewToPresenterProtocol & WeatherListInteractorToPresenterProtocol)!
    var interactor: WeatherListPresentorToInteractorProtocol!
    var router: WeatherListPresenterToRouterProtocol!
    
    let weather: NKWeatherCodable = .init(
        lat: 23.0225,
        lon: 72.5714,
        current: NKWeatherCurrent.init(
            dt: 1659980790,
            temp: 30,
            weather: [
                NKWeatherWeather.init(
                    id: 800,
                    main: "Clear",
                    icon: "10a")
            ]),
        minutely: nil,
        hourly: [
            NKWeatherCurrent.init(
            dt: 1659980790,
            temp: 30,
            weather: [
                NKWeatherWeather.init(
                    id: 800,
                    main: "Clear",
                    icon: "10a")
            ]),
            NKWeatherCurrent.init(
                dt: 1659990790,
                temp: 32,
                weather: [
                    NKWeatherWeather.init(
                        id: 800,
                        main: "Clear",
                        icon: "10a")
                ]),
            NKWeatherCurrent.init(
                dt: 1659999790,
                temp: 33,
                weather: [
                    NKWeatherWeather.init(
                        id: 800,
                        main: "Clear",
                        icon: "10a")
                ])],
        daily: [
            NKWeatherDaily.init(
                dt: 1659980790,
                temp: NKWeatherTemp.init(min: 28, max: 34),
                weather: [
                    NKWeatherWeather.init(
                        id: 800,
                        main: "Rain",
                        icon: "10a")
                ]),
            NKWeatherDaily.init(
                dt: 1659980790,
                temp: NKWeatherTemp.init(min: 29, max: 35),
                weather: [
                    NKWeatherWeather.init(
                        id: 800,
                        main: "Rain",
                        icon: "10a")
                ])
        ] )
    
    override func setUp() {
        view = WeatherSevenDaysListVC()
        presenter = WeatherListPresenter()
        interactor = WeatherListInteractor()
        router = WeatherListRouter()
        
        interactor.weather = weather
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    override func tearDown() {
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }
    
    func test_getWeatherDailyCount() throws {
        // When
        interactor.weather = weather
        
        // Then
        XCTAssertEqual(2, presenter.getWeatherDailyCount())
    }
    
    func test_getWeatherHours_index() throws {
        // When
        interactor.weather = weather
        
        // Then
        XCTAssertEqual(28, presenter.getWeatherDaily(index: 0)?.temp?.min)
    }
}
