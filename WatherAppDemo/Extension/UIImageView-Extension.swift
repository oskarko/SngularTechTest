//
//  UIImageView-Extension.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageUrl(_ url:NKUrlValue?) -> Void {
        var mainUrl:URL? = nil
        if let value = url as? URL {
            mainUrl = value
        } else if let value = url as? String {
            mainUrl = value.asUrl
        } else {
            self.kf.cancelDownloadTask()
            self.image = nil
        }
        
        guard (mainUrl != nil) else {
            self.kf.cancelDownloadTask()
            self.image = nil
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: mainUrl,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
        ])
    }
    
    func cancle() {
        self.kf.cancelDownloadTask()
        self.image = nil
    }
    
    var imageAnimation:UIImage? {
        get {
            return image
        }
        set {
            UIView.transition(
                with: self,
                duration:0.3,
                options: .transitionCrossDissolve,
                animations: { self.image = newValue },
                completion: nil)
        }
    }
}

protocol NKUrlValue { }
extension URL: NKUrlValue { }
extension String: NKUrlValue { }
