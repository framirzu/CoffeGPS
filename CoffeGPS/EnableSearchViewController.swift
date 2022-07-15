////
////  ViewController.swift
////  CoffeGPS
////
////  Created by Franzua Renzo Ramirez Gaston Zuloeta on 25/06/22.
////
//
import UIKit

class EnableSearchViewController: UIViewController {
    
    //creamos una variable en el ViewController, y la enlazamos con la vista de un elemento de la interfaz (UIButton)
    
    @IBOutlet var startToSearchButton: UIButton!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        startToSearchButton.tintColor = .darkGray
        startToSearchButton.isEnabled = true
        LocationManager.shared.getLocation()

    }

    @IBAction func didTapbutton(){
        
            RemoteRepository().getCafeterias { cafeterias in
                
                //Name: El nombre del archivo de recursos del guión gráfico
                // bundle: El "bundle contiene los archivos y los recursos relacionados al storyboard.
//                Si especifica nil, este método busca en el principal "Bundle" de la aplicación actual.
                
                //el objeto storyboard lo vamos a utilizamos para instanciar especificamente el ViewController "ListaCafeteriasViewController"
//
                let storyboard = UIStoryboard(name: "Main", bundle: nil)//
                
                //Cada vez que llama a este método, crea una nueva instancia del ViewController
                
//                let vc = storyboard.instantiateViewController(withIdentifier: "ListCafeteriasViewController") as! ListCafeteriasViewController
            
                let vc = storyboard.instantiateViewController(withIdentifier: "ListCafeteriasViewController") as! ListCafeteriasViewController
                
                //el whitidentifier o ID: El storyboard lo usa para ubicar los datos apropiados para su controlador de vista.
                
                //Llamamos al ViewController y ordenamos los datos de menor a mayor
                //segun la distancia
                vc.cafeterias = cafeterias.sorted{ (a, b) -> Bool in
                    return a.distancia < b.distancia
                    
                }
                    self.show(vc, sender: nil) //
            }
        }
        
        
    }
