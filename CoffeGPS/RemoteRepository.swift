//
//  LocalRepository.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//

import Foundation
import UIKit
import CoreLocation

class RemoteRepository{
    
    func getCafeterias(block: @escaping ([CafeteriasLocalesStruct]) -> Void) {
        // de la linea 15 hasta la 24 es para conectarte al json
        guard let url = URL(string:"https://mocki.io/v1/668549df-8e4c-48ae-9664-ab24714f66b8" ) else {return}
        URLSession.shared.dataTask(with:url){(data,response,error) in //nos permite descargar datos contenidos en la url
            
            // de la linea 24 hasta linea 38 es para convertir json a swift
            guard let data = data, error == nil else {
                return
            }
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
//////                    // Desde esta linea ya puedo leer los Datos ya convertidos de Json a Swift

                   print(response.locales.count)
                    block(response.locales)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}

