//
//  NKLocation.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit
import CoreLocation
import SPPermissions
import SPPermissionsLocationWhenInUse


class NKLocation: NSObject {
    
    static let m = NKLocation()
    
    var locationManager = CLLocationManager()
    
    var lastLocation:CLLocation?
    
    var onceUpdateLocation: ((_ location:CLLocation?) -> Void)? {
        didSet {
            if let once = onceUpdateLocation {
                if let last = lastLocation {
                    once(last)
                    onceUpdateLocation = nil
                } else {
                    self.locationManager.startUpdatingLocation()
                }
            }
        }
    }
    
    private var requestLocationAuthorizationCallback: ((CLAuthorizationStatus) -> Void)?
    
    func configure() {
        locationManager.activityType = .otherNavigation
        locationManager.distanceFilter = 0.5
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    func checkPermission(_ target:UIViewController) -> Bool  {
        let authorized = SPPermissions.Permission.locationWhenInUse.authorized
        if authorized {
            return true
        } else {
            let permissions: [SPPermissions.Permission] = [.locationWhenInUse]
            //let controller = SPPermissions.dialog(permissions)
            let controller = SPPermissions.list(permissions)
            controller.showCloseButton = true
            controller.present(on: target)
            return false
        }
    }
    
    func checkPermission() -> Bool  {
        let authorized = SPPermissions.Permission.locationWhenInUse.authorized
        if authorized {
            return true
        } else {
            return false
        }
    }
    
    
}

extension NKLocation: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.requestLocationAuthorizationCallback?(status)
        switch status {
        case CLAuthorizationStatus.restricted: break
        case CLAuthorizationStatus.denied: break
        case CLAuthorizationStatus.notDetermined: break
        default:
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        if let once = onceUpdateLocation {
            once(location)
            onceUpdateLocation = nil
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


extension CLLocation {
    func getAddress(_ handler: @escaping ((String?) -> Void)) -> Void {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(self, completionHandler: {
            placemarks, error -> Void in
            guard let placeMark = placemarks?.first else {
                handler("")
                return
            }
            
            var addTp = ""
            
            if let locationName = placeMark.location {
                print(locationName)
            }
            // Street address
            if let street = placeMark.thoroughfare {
                print(street)
            }
            // City
            if let city = placeMark.subAdministrativeArea {
                print(city)
                addTp = city
            }
            // Zip code
            if let zip = placeMark.isoCountryCode {
                print(zip)
            }
            // Country
            if let country = placeMark.country {
                print(country)
                addTp = addTp + (addTp.isEmpty ? "" : ", ") + country
            }
            handler(addTp)
        })
    }
    
    
    func getCity(_ handler: @escaping ((String?) -> Void)) {
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(self, completionHandler: {
            placemarks, error -> Void in
            guard let placeMark = placemarks?.first else {
                handler("")
                return
            }
            
            var addTp = ""
            if let locality = placeMark.locality {
                addTp = locality
            } else  if let city = placeMark.subAdministrativeArea {
                addTp = city
            }
            handler(addTp)
        })
    }
}
