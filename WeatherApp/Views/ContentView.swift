//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mohamed Elshaer on 06/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Propreties.
    @StateObject var locationManger = LocationManger()
    @State var weather: WeatherData?
    var weatherManger: WeatherManger = WeatherManger()
    
    var body: some View {
        VStack {
            
            if let location = locationManger.location {
                if let weather = weather {
                    WeatherView(weatherData: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManger.getCurrentWeather(lat: location.latitude, 
                                                                                    long: location.longitude)
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                }
            } else {
                if locationManger.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManger)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
