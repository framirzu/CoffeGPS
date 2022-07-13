//
//  GetMyLocation.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//

import UIKit
import CoreLocation

//LocationManager.shared.getLocation()

//LocationManager.shared.seeAuthorizationStatus()

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
        seeAuthorizationStatus()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

            location = locations.first?.coordinate
        print("location manager")

        print("localizacion actual \(String(describing: location))")
        
        //seeAuthorizationStatus()
        
        }
    
//    func seeAuthorizationStatus()->Int{
//func seeAuthorizationStatus()->Int{
//        print("seeAuthoriationStatus")
//        if CLLocationManager.locationServicesEnabled() {
//            switch locationManager.authorizationStatus {
//                case .notDetermined:
//                    return 0
//            case .restricted:
//                return 1
//            case .denied:
//                return 2
//            case .authorizedAlways:
//                return 3
//            case  .authorizedWhenInUse:
//                return 4
//            @unknown default:
//                return 12
//            }
//
//        }else{
//
//
//            return 10
//        }
//
//    }
    
    
    
    
    
    func seeAuthorizationStatus(){
            print("seeAuthoriationStatus")
            if CLLocationManager.locationServicesEnabled() {
                switch locationManager.authorizationStatus {
                    case .notDetermined:
                        print("No determinado")
                    
                case .restricted:
                        print("restringuido")
                case .denied:
                        print("denegado")
                case .authorizedAlways:
                        print("Autorizado Always")
                case  .authorizedWhenInUse:
                        print("Autorizado cuando lo uso")
                @unknown default:
                        print("Caso indefinido")
                }
            
            }else{
                
                
                print("Servicio de location no permitido")
            }
        
        }
}
