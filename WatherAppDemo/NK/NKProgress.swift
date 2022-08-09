//
//  NKProgress.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

class NKProgress: UIView {
    
    var indicatorViewObj = UIActivityIndicatorView()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        if #available(iOS 13.0, *) {
            indicatorViewObj.style = .medium
        } else {
            indicatorViewObj.style = .gray
        }
        self.setUpView(frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open class var shared: NKProgress {
        struct NKIndicatorViewSingleton {
            static let instance = NKProgress(frame: UIScreen.main.bounds)
        }
        return NKIndicatorViewSingleton.instance
    }
    
    private func setUpView(_ frm:CGRect) -> Void {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        self.frame = frm
        self.addSubview(self.indicatorViewObj)
        self.indicatorViewObj.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = self.indicatorViewObj.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let verticalConstraint = self.indicatorViewObj.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        self.isHidden = true
    }
    
    private func showIndicatior(inView:UIView!, color:UIColor? = nil) -> Void {
        if inView != nil {
            setUpView(inView.bounds)
            inView?.addSubview(self)
            inView?.setConstraints(to: self)
        } else {
            setUpView(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
            AppDelegate.keyWindow?.addSubview(self)
            AppDelegate.keyWindow?.setConstraints(to: self)
        }
        self.indicatorViewObj.startAnimating()
        self.animationView(view: self, hidden: false)
        if let color = color {
            self.backgroundColor = color
            self.indicatorViewObj.color = .darkGray
        } else {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.35)
            self.indicatorViewObj.color = .white
        }
    }
    
    private func animationView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.15, options: .transitionCrossDissolve, animations: {() -> Void in
            view.isHidden = hidden
        }, completion: { _ in
            if hidden {
                self.removeFromSuperview()
            }
        })
    }
    
    private func dismissView() -> Void {
        self.animationView(view: self, hidden: true)
    }
    
    //access Class
    
    open class func show(color:UIColor? = nil) -> Void {
        self.shared.showIndicatior(inView: nil, color: color)
    }
    
    open class func show(inView:UIView!, color:UIColor? = nil) -> Void {
        self.shared.showIndicatior(inView: inView, color: color)
    }
    
    open class func dismiss() -> Void {
        self.shared.dismissView()
    }
}

