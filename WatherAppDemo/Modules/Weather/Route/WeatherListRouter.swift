//
//  WeatherListRouter.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherListRouter: WeatherListPresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = WeatherSevenDaysListVC()
        let presenter: WeatherListViewToPresenterProtocol & WeatherListInteractorToPresenterProtocol = WeatherListPresenter()
        let interactor: WeatherListPresentorToInteractorProtocol = WeatherListInteractor()
        let router: WeatherListPresenterToRouterProtocol = WeatherListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
