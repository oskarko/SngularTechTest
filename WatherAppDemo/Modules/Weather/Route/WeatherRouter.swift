//
//  WeatherRouter.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherRouter: WeatherPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = WeatherVC()
        
        let presenter: WeatherViewToPresenterProtocol & WeatherInteractorToPresenterProtocol = WeatherPresenter()
        
        let interactor: WeatherPresentorToInteractorProtocol = WeatherInteractor()
        let router: WeatherPresenterToRouterProtocol = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        let nav = UINavigationController(rootViewController: view)
        return nav
    }
}
