//
//  WeatherManger.swift
//  WeatherApp
//
//  Created by Mohamed Elshaer on 06/01/2023.
//

import Foundation
import CoreLocation

class WeatherManger {
    func getCurrentWeather(lat: CLLocationDegrees, long: CLLocationDegrees) async throws -> WeatherData{
        let APIKey: String = "91cc0111847585459f4849aab2946670"
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&appid=\(APIKey)&units=metric") else {fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error With Fetching the Data.")}
        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
        return decodedData
    }
}
