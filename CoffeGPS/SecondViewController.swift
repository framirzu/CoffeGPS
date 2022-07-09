//
//  SecondViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 26/06/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cafeterias: [CafeteriasLocalesStruct] = []
//    let locales = [
//        Local(nombre: "Local 1", direccion: "Calle independencia 278"),
//        Local(nombre: "Local 2", direccion: "Calle Tacna 980"),
//        Local(nombre: "Local 3", direccion: "AV.GIANLUCA")
//    ]
//
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->
    String?{
        
        cafeterias.first?.nombre
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        
        let cafe = cafeterias[indexPath.row]
        print("cafeterias \(cafeterias)")
        cell?.nameLocalCell?.text = cafe.nombre.capitalized
        
        cell?.descriptioncell?.text = "Distania: " + String(format : "%0.2f", cafe.distancia) + " km"
        cell?.estrellasCell?.text = "Valoracion: " + String(cafe.estrellas) + "⭐️"
        cell?.direccionesCell?.text = "Ubicación: " + String(cafe.direccion)
        
        if let url = URL(string: cafe.url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main threadself.imageView.image = UIImage(data: da
                    cell?.imageCell?.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
        
        cell?.imageCell?.image = UIImage()
    
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return locales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let local = locales[indexPath.row]
        cell.textLabel?.text = local.nombre
        cell.detailTextLabel?.text = local.direccion
        return cell
     */
    
}


