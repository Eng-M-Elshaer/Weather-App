//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Mohamed Elshaer on 06/01/2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManger: LocationManger
    
    fileprivate func extractedFunc() -> some View {
        return VStack {
            VStack(spacing: 20) {
                Text("Welcome To The Weather App")
                    .bold().font(.title)
                Text("Please Share Your Current Location to Get The Info About The Weather of Your Area.")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.sendCurrentLocation) {
                locationManger.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var body: some View {
        extractedFunc()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
