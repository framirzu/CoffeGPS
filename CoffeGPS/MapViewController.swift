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

    
    @IBOutlet weak var tableView: UILabel!

    var locales: CafeteriasLocalesStruct?
    
    
    @IBOutlet var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.text = "\((locales?.latitude)!)  comes under the category \((locales?.longitude)!) "
        
        // Imprime en la consola la latitud y longitud del local seleccionado
        // en la celda de LisCafeteriasViewController
        print(((locales?.latitude)!) )
        print(((locales?.longitude)!) )
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        manager.desiredAccuracy = kCLLocationAccuracyBest // implica uso de bateria ya que activa GPS para + precision
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    //esta funcion es llamada cuando el manager location es uopdate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
       
            manager.stopUpdatingLocation()
            
            render (location: location)
            
        }
    }
    func    render( location: CLLocation) {
        
//        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
//                                                        longitude: location.coordinate.longitude)
                
        
        let coordinate = CLLocationCoordinate2D(latitude: ((locales?.latitude)!),
                                                longitude: ((locales?.longitude)!))
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinate,
                                        span: span)
        mapView.setRegion(region,
                          animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
        
    }
}
