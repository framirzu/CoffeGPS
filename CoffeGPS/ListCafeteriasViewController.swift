//
//  SecondViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 26/06/22.
//
//
import UIKit

class ListCafeteriasViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cafeterias: [CafeteriasLocalesStruct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableView.delegate=self
        tableView.dataSource = self
        
        // Hace algo adicional del setup despues de cargar la vista
    }

}

extension ListCafeteriasViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->
    String?{
        
        cafeterias.first?.nombre // Pone el nombre del primer local en la lista como cabecera
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count // indica el numero de filas que habra en la sección
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell
        
        // Obtiene los datos de cada elemento, es decir obtiene los datos de cada cafeteria por celda
        
        let dataDeLaCafeteria = cafeterias[indexPath.row]
        print("cafeterias \(cafeterias)")
        
    
        cell?.nameLocalCell?.text = dataDeLaCafeteria.nombre.capitalized
        cell?.descriptioncell?.text = "Distancia " + String(format : "%0.2f", dataDeLaCafeteria.distancia) + " km"
        cell?.estrellasCell?.text = "Valoracion: " + String(dataDeLaCafeteria.estrellas) + "⭐️"
        cell?.direccionesCell?.text = "📌:" + dataDeLaCafeteria.direccion
        
        // Obtenemos el url de cada cafeteria y los muestra a traves de UIImage
        
        if let url = URL(string: dataDeLaCafeteria.url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main threadself.imageView.image = UIImage(data: data)
                    cell?.imageCell?.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        cell?.imageCell?.image = UIImage()
    
        return cell!
    }
    //Le dice al Delegate que fila ha sido seleccionada.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showmecoordenates", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapViewController {
            destination.locales = cafeterias[(tableView.indexPathForSelectedRow?.row)!]
        
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}


