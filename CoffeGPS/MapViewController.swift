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
    
    @IBOutlet weak var tableViewLabel: UILabel!

    var locales: CafeteriasLocalesStruct?
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        // Latitud y longitud de la ubicacion de la cafeteria:

        guard let latitudCafeteria  = (locales?.latitude) else {return}
        guard let longitudCafeteria = (locales?.longitude) else {return}
        let coordinate = CLLocationCoordinate2D(latitude: latitudCafeteria,
                                                longitude: longitudCafeteria)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        // Muestra en una region del mapa
        mapView.setRegion(region, animated: true)
        
        
        // nombre de local seleccionado guardo en la variable
        guard let nameLocals = (locales?.nombre) else {return}
        
        // muestra con un Pin en el Mapa la ubicacion del local
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = String(nameLocals)
        
        tableViewLabel.text = "Distancia :" + String(format: "%0.2f", (locales?.distancia)!) + "km"
        
        // nos displaya la ubicacion del local en el mapa
        mapView.addAnnotation(pin)
        ///////
     
        // nos Displaya la ubicación del usuario en el mapa
        self.mapView.showsUserLocation = true
    
        
    }
}
