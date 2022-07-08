//
//  ViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 25/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mySwitch: UISwitch!
    
    @IBOutlet var labelGPS: UILabel!

    @IBOutlet var buscarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if mySwitch.isOn {
            buscarButton.isEnabled = true
        } else {
            buscarButton.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func switchDidChange(_ sender: UISwitch) {
        
        if sender.isOn {
            labelGPS.text = "GPS Activado";
            buscarButton.isEnabled = true
        }else{

            labelGPS.text = "GPS Desactivado"
            buscarButton.isEnabled = false
        }
    }
    
    @IBAction func didTapbutton(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "list_vc") 
         show(vc, sender: nil)
        
    }
     
    
    
}
