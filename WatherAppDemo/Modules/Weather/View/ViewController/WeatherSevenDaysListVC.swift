//
//  WeatherSevenDaysListVC.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class WeatherSevenDaysListVC: UIViewController {

    @IBOutlet private weak var tableView:UITableView!
    
    var presenter: WeatherListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        setUpTableView()
        if let location = NKLocation.m.lastLocation {
            NKProgress.show(inView: view, color: .clear)
            self.presenter?.updateView(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
    
    private func setUpUI() {
        navigationItem.title = "7 Days"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "icon-navi-back".asImage?.asOriginal,
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(onClickBack))
    }
    
    private func setUpTableView() {
        let nib = UINib(nibName: WeatherDayTVC.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: WeatherDayTVC.className)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    @objc private func onClickBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension WeatherSevenDaysListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getWeatherDailyCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDayTVC.className) as! WeatherDayTVC
        cell.data = presenter?.getWeatherDaily(index: indexPath.row)
        return cell
    }
}


extension WeatherSevenDaysListVC: WeatherListPresenterToViewProtocol {
    func dismissActivityIndicator() {
        NKProgress.dismiss()
    }
    
    func showCurrentWeather() {
        NKProgress.dismiss()
        tableView.reloadData()
    }
    
    func showError() {
        NKProgress.dismiss()
        let alert = UIAlertController(title: "Alert",
                                      message: "Problem Fetching Weather",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay",
                                      style: .default,
                                      handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
