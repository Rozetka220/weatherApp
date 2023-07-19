//
//  Coordinats.swift
//  weatherApp
//
//  Created by Аделия Исхакова on 15.07.2023.
//


//MARK: - По имени города получаем его координаты

import Foundation

struct Coordinats: Codable {
    let name: String //возможно в самый вверх
    let lat: Double
    let lon: Double
}
