//
//  MapViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 7/07/22.
//
import CoreLocation
import MapKit
import UIKit

class MapViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UILabel!

    var locales: CafeteriasLocalesStruct?
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.text = "\((locales?.latitude)!)  es la latitud  y \((locales?.longitude)!) es la longitud del local \((locales?.nombre)!)"
        // Imprime en la consola la latitud y longitud del local seleccionado
        // en la celda de LisCafeteriasViewController
        print(((tableView.text)!) )
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        manager.desiredAccuracy = kCLLocationAccuracyBest // implica uso de bateria ya que activa GPS para + precision
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
              
    }

    //esta funcion es llamada cuando el manager location es update
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let mylocation = locations.first {
       
            manager.stopUpdatingLocation()

            render (location: mylocation)
        }
      
    }
    func    render( location: CLLocation) {
        
        // Latitud y longitud de la ubicacion del celular:
//     let coordinate = CLLocationCoordinate2D(latitude:            //                                              location.coordinate.latitude,
//                                           longitude: //                                                          location.coordinate.longitude)
        // saca el valro de Latitud y Lontgitud de la cafeteria seleccionada en la celda.
        let latitudCafeteria  = ((locales?.latitude)!)
        let longitudCafeteria = ((locales?.longitude)!)
        
        let coordinateUser = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                    longitude: location.coordinate.longitude)
        
        ///
        let coordinate = CLLocationCoordinate2D(latitude: latitudCafeteria,
                                                longitude: longitudCafeteria)
        
        
        
        
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        mapView.setRegion(region, animated: true)
        
        
        // nombre de local seleccionado
        let nameLocals = (locales?.nombre)!
        // muestra con un Pin en el Mapa la ubicacion del local
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = String(nameLocals)
        mapView.addAnnotation(pin)
        ///////
        ///
        ///nombre del Usuario
        let nameUser = "Yo"
        
        // muestra con un pin en el mapa la ubicacion del usuario
        let pinUser = MKPointAnnotation()
        pinUser.coordinate = coordinateUser
        pinUser.title = String(nameUser)
        mapView.addAnnotation(pinUser)
        ///////
        
        
    }
}
