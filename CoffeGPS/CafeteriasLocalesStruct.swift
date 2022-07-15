//
//  CafeteriasLocalesStruct.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//
import CoreLocation

struct CafeteriasLocalesStruct:Codable {
    let nombre: String
    let estrellas: Int
    let direccion: String
    let url: String
    let latitude: Double
    let longitude: Double
    var distancia: Double{
        //compute property
        
        guard let mylatitude = LocationManager.shared.location?.latitude else {return -12.07491157954171}
        
        guard let mylongitud = LocationManager.shared.location?.longitude else
        {return -77.03465858298718}
        
                    // Mis Coordenadas latitud y longitud transformadas a Objeto con CLLocation
        let selfLocation = CLLocation(latitude: mylatitude, longitude: mylongitud)
                // Coordenas de latitud y longitud del local transformadas a a objeto CLLocation
        let location = CLLocation(latitude: latitude, longitude:longitude)
                //
        let distancia = selfLocation.distance(from: location)/1000
        
        return distancia
        
        }
}


//// Antiguo codigo forzando desempaquetado de la propiedad location
        
//        let mylatitude = LocationManager.shared.location!.latitude
//        //
//        let mylongitud = LocationManager.shared.location!.longitude //
//        // Mis Coordenadas latitud y longitud transformadas a Objeto con CLLocation
//        let selfLocation = CLLocation(latitude: mylatitude, longitude: mylongitud)
//        // Coordenas de latitud y longitud del local transformadas a a objeto CLLocation
//        let location = CLLocation(latitude: latitude, longitude:longitude)
//        //
//        let distancia = selfLocation.distance(from: location)/1000
//
//        return distancia
//
//    }
//}
