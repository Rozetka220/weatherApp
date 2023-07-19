//
//  Error.swift
//  weatherApp
//
//  Created by Аделия Исхакова on 17.07.2023.
//

import Foundation

struct Openweathermap: Codable, Error {
    let cod: Int
    let message: String
}
