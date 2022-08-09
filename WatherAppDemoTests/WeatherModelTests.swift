//
//  WeatherModelTests.swift
//  WatherAppDemoTests
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import XCTest
@testable import WatherAppDemo

class WeatherModelTests: XCTestCase {

    var view:WeatherVC!
    var presenter: MockWeatherPresenter!
    var interactor: WeatherPresentorToInteractorProtocol!
    var router: WeatherPresenterToRouterProtocol!
    
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
        daily: nil)
    
    
    override func setUp() {
        view = WeatherVC()
        presenter = MockWeatherPresenter()
        interactor = WeatherInteractor()
        router = WeatherRouter()
        
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
    
    
    func test_getWeather() throws {
        // When
        interactor.weather = weather
        
        // Then
        XCTAssertNotNil(presenter.getWeather)
    }
    
    func test_getWeatherDailyCount() throws {
        // When
        interactor.weather = weather
        
        // Then
        XCTAssertEqual(3, presenter.getWeatherHoursCount())
    }
    
    func test_getWeatherHours_index() throws {
        // When
        interactor.weather = weather
        
        // Then
        XCTAssertEqual(30, presenter.getWeatherHours(index: 0)?.temp)
    }
}
