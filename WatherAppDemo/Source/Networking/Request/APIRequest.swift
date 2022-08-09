//
//  APIRequest.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

protocol APIRequest {
    var url: URL? { get }
    var path: APIPath { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var params: Any? { get }
    var timeoutInterval: TimeInterval { get }
}

extension APIRequest {
    // Default values
    var url: URL? { nil }
    var queryItems: [URLQueryItem]? { nil }
    var params: Any? { nil }
    var timeoutInterval: TimeInterval { 10.0 }
}
