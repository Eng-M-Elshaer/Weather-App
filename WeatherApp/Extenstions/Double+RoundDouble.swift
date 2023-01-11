//
//  Double+RoundDouble.swift
//  WeatherApp
//
//  Created by Mohamed Elshaer on 06/01/2023.
//

import Foundation

extension Double {
    func roundDoble() -> String {
        return String(format: "%.0f", self)
    }
}
