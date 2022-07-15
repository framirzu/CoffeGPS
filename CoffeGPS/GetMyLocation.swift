//
//  GetMyLocation.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {

    static let shared = LocationManager()
    
    var location: CLLocationCoordinate2D?
    
    let locationManager = CLLocationManager()

    override init(){
        super.init()
        self.locationManager.delegate = self
    }
    
    func getLocation(){
        
        self.locationManager.requestWhenInUseAuthorization()
        
        print("get location")
        
        self.locationManager.startUpdatingLocation()
        //seeAuthorizationStatus()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            location = locations.first?.coordinate
        print("location manager")

        print("localizacion actual \(String(describing: location))")
        
        }
}
