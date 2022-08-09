//
//  NKWeatherCodable.swift
//  WatherAppDemo
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import UIKit

// MARK: - NKWeatherCodable
struct NKWeatherCodable: Codable {
    var lat, lon: Double?
    var timezone: String?
    var timezoneOffset: Double?
    var current: NKWeatherCurrent?
    var minutely: [NKWeatherMinutely]?
    var hourly: [NKWeatherCurrent]?
    var daily: [NKWeatherDaily]?

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, minutely, hourly, daily
    }
}

// MARK: - NKWeatherCurrent
struct NKWeatherCurrent: Codable {
    var dt, sunrise, sunset: Double?
    var temp, feelsLike: Double?
    var pressure, humidity: Double?
    var dewPoint, uvi: Double?
    var clouds, visibility: Double?
    var windSpeed: Double?
    var windDeg: Double?
    var weather: [NKWeatherWeather]?
    var windGust, pop: Double?
    var rain: NKWeatherRain?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case windGust = "wind_gust"
        case pop, rain
    }
}

// MARK: - NKWeatherRain
struct NKWeatherRain: Codable {
    var the1H: Double?

    enum CodingKeys: String, CodingKey {
        case the1H = "1h"
    }
}

// MARK: - NKWeatherWeather
struct NKWeatherWeather: Codable {
    var id: Int?
    var main: String?
    var weatherDescription: String?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - NKWeatherDaily
struct NKWeatherDaily: Codable {
    var dt, sunrise, sunset, moonrise: Double?
    var moonset: Double?
    var moonPhase: Double?
    var temp: NKWeatherTemp?
    var feelsLike: NKWeatherFeelsLike?
    var pressure, humidity: Double?
    var dewPoint, windSpeed: Double?
    var windDeg: Double?
    var windGust: Double?
    var weather: [NKWeatherWeather]?
    var clouds: Double?
    var pop, rain, uvi: Double?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, rain, uvi
    }
}

// MARK: - NKWeatherFeelsLike
struct NKWeatherFeelsLike: Codable {
    var day, night, eve, morn: Double?
}

// MARK: - NKWeatherTemp
struct NKWeatherTemp: Codable {
    var day, min, max, night: Double?
    var eve, morn: Double?
}

// MARK: - NKWeatherMinutely
struct NKWeatherMinutely: Codable {
    var dt, precipitation: Double?
}
