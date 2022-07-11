//
//  LocalRepository.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//

import Foundation
import UIKit
import CoreLocation

//Antes
//class LocalRepository{
class LocalRepository{
    
    //func getCafeterias(){
    func getCafeterias(block: @escaping ([CafeteriasLocalesStruct]) -> Void) {
        
        // de la linea 22 hasta la 24 es para conectarte al json
        guard let url = URL(string:"https://mocki.io/v1/668549df-8e4c-48ae-9664-ab24714f66b8" ) else {return}
        URLSession.shared.dataTask(with:url){(data,response,error) in
            // de la linea 24 hasta linea 38 es para convertir json a swift
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    // Desde esta linea ya puedo leer los Datos ya convertidos de Json a Swift
                    //print(response.locales[1].latitude)
                    print(response.locales.count)
                    block(response.locales)
                    
                   //Codigo de pruebe desde la linea 38 hasta la 60
                    //Coordenadas de mi ubicacion
                    
                  
                    let mylatitude = LocationManager.shared.location!.latitude
                    let mylongitud = LocationManager.shared.location!.longitude

                // Mis Coordenadas latitud y longitud transformadas a Objeto con CLLocation
                    let selfLocation = CLLocation(latitude: mylatitude, longitude: mylongitud)

                    // Formula para poner en objeto CLLocation las Coordenadas latitud y longitud
                    //  los diferentes locales
                    //let location = CLLocation(latitude: response.locales[0].latitude, longitude: response.locales[0].longitude)


                   // let distance = selfLocation.distance(from: CLLocation(latitude: response.locales[0].latitude, longitude: response.locales[0].longitude))/1000

//
                    let numberOfLocals = response.locales.count - 1
//
                    var arregloDistancia = [Double]()
                    var arregloNombresLocales = [String]()
                    func ArregloDistancias(){
//
                        for i in 0...numberOfLocals{
//
                            let nombre = response.locales[i].nombre
                            let distance = selfLocation.distance(from: CLLocation(latitude: response.locales[i].latitude, longitude: response.locales[i].longitude))/1000
                            // print(distance)
                            arregloDistancia.append(distance)
                            arregloNombresLocales.append(nombre)
//
                            }
                        print(arregloDistancia)
                        print(arregloNombresLocales)
                    }
                    ArregloDistancias()
                    
                   /// hasta aqui termina el codigo agregado
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    func loadJSONfile(_ name: String) -> Data? { // Da la ruta donde esta el archivo JSON Cafeterias
        
        //Data
        guard let url = Bundle.main.url(forResource: name , withExtension: "json") else {
            return nil }
        return try? Data(contentsOf: url)
        
    }
}

