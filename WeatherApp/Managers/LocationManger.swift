//
//  LocationManger.swift
//  WeatherApp
//
//  Created by Mohamed Elshaer on 06/01/2023.
//

import Foundation
import CoreLocation

class LocationManger: NSObject, ObservableObject{
    
    //MARK: - Propreties.
    private let manger = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    
    //MARK: - Init.
    override init() {
        super.init()
        manger.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manger.requestLocation()
    }
}

//MARK: - Location Manager Delegate.
extension LocationManger: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error in Getting the Location: ", error.localizedDescription)
        isLoading = false
    }
}
