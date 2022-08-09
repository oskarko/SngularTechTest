//
//  Extension.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

extension NSObject {
    class var className: String {
        String(describing: self.self)
    }
}

var isiPad: Bool {
    UIDevice.current.userInterfaceIdiom == .pad
}


extension String  {
    var isNumber: Bool {
        !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    var asUrl: URL? {
        URL(string: self)
    }
    
    var asDouble: Double {
        Double(self) ?? 0
    }
    
    var asInt: Int {
        Int(self) ?? 0
    }
    
    func trim() -> String {
        self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    var asImage: UIImage? {
        UIImage(named: self)
    }
}

extension UIImage {
    var asOriginal: UIImage {
        self.withRenderingMode(.alwaysOriginal)
    }
    
    var asTemplate: UIImage {
        self.withRenderingMode(.alwaysTemplate)
    }
}

extension UIView {
    
    func setConstraints(to child:UIView) -> Void {
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.topAnchor.constraint(equalTo: self.topAnchor),
            child.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            child.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            child.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func circle(_ radius: Int = 0) {
        if (radius == 0) {
            layer.cornerRadius = self.frame.size.height/2
        } else {
            layer.cornerRadius = CGFloat(radius)
        }
        layer.masksToBounds = true
    }
    
    func border(_ width: CGFloat = 0, color: UIColor = .white) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
}

extension String {
    var asWeatherIcon: String {
        "https://openweathermap.org/img/wn/\(self)@2x.png"
    }
}

extension Double {
    var asDate: Date {
        Date(timeIntervalSince1970: self)
    }
    
    var asDateOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .full
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEEE, dd-MM-YY"
        
        return dateFormatter.string(from: date)
    }
    
    var asTimeOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "h a"
        
        return dateFormatter.string(from: date)
    }
    
    var asDateDayOnly: String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "EEE"
        
        return dateFormatter.string(from: date)
    }
}

extension Date {
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
