//
//  ViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 25/06/22.
//

import UIKit

class EnableSearchViewController: UIViewController {
    
    @IBOutlet var gpsSwitch: UISwitch!
    
    @IBOutlet var labelGPS: UILabel!

    @IBOutlet var startToSearchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if gpsSwitch.isOn {
            startToSearchButton.isEnabled = true
        } else {
            startToSearchButton.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func switchDidChange(_ sender: UISwitch) {
        
        if sender.isOn {
            LocationManager.shared.getLocation()
            labelGPS.text = "GPS Activado";
            startToSearchButton.isEnabled = true
        }else{

            labelGPS.text = "GPS Desactivado"
            startToSearchButton.isEnabled = false
        }
    }
    
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
