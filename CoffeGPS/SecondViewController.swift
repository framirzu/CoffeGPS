//
//  SecondViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 26/06/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var cafeterias: [CafeteriasLocalesStruct] = []
//    let locales = [
//        Local(nombre: "Local 1", direccion: "Calle independencia 278"),
//        Local(nombre: "Local 2", direccion: "Calle Tacna 980"),
//        Local(nombre: "Local 3", direccion: "AV.GIANLUCA")
//    ]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return locales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let local = locales[indexPath.row]
        cell.textLabel?.text = local.nombre
        cell.detailTextLabel?.text = local.direccion
        return cell
    }
}
