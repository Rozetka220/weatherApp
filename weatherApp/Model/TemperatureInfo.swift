//
//  TemperatureInfo.swift
//  weatherApp
//
//  Created by Аделия Исхакова on 15.07.2023.
//


//MARK: - По координатам получаем температуру
import Foundation

struct TemperatureInfo: Codable {
    let main: MainInfo
    let name: String
}

struct MainInfo: Codable {
    let temp: Double
}
