////
////  ViewController.swift
////  CoffeGPS
////
////  Created by Franzua Renzo Ramirez Gaston Zuloeta on 25/06/22.
////
//
//import UIKit
//
//class EnableSearchViewController: UIViewController {
//
//
//    @IBOutlet var startToSearchButton: UIButton!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//func startRequestLocation() {
//
//    LocationManager.shared.getLocation()
//    if LocationManager.shared.seeAuthorizationStatus() > 0 {
//
//               startToSearchButton.isEnabled = true
//
//        }else {
//                print("Ejecucion de cierre")
//            startToSearchButton.isEnabled = false
//        }
//
//    }
//
//@IBAction func didTapbutton(){
//
//            LocalRepository().getCafeterias { cafeterias in
//
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let vc = storyboard.instantiateViewController(withIdentifier: "ListCafeteriasViewController") as! ListCafeteriasViewController
//
//                //Llamamos a LocalRepository
//                vc.cafeterias = cafeterias.sorted{ (a, b) -> Bool in
//                    return a.distancia < b.distancia
//
//                }
//                    self.show(vc, sender: nil)
//            }
//        }
//    }


import UIKit

class EnableSearchViewController: UIViewController {
    

    @IBOutlet var startToSearchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startToSearchButton.isEnabled = true
        LocationManager.shared.getLocation()
//
    }
//
    @IBAction func didTapbutton(){
        
            LocalRepository().getCafeterias { cafeterias in
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ListCafeteriasViewController") as! ListCafeteriasViewController
            
                //Llamamos a LocalRepository
                vc.cafeterias = cafeterias.sorted{ (a, b) -> Bool in
                    return a.distancia < b.distancia
                    
                }
                    self.show(vc, sender: nil)
            }
        }
        
        
    }
