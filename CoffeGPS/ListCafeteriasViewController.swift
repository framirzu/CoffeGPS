//
//  SecondViewController.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 26/06/22.
//
//
import UIKit

class ListCafeteriasViewController: UIViewController {
    
    //creamos una variable en el ViewController, y la enlazamos con la vista de un elemento de la interfaz (UITableView)
    
    @IBOutlet weak var tableView: UITableView!
    
    var cafeterias: [CafeteriasLocalesStruct] = []

    override func viewDidLoad() { // Hace algo adicional del setup despues de cargar la vista
        super.viewDidLoad()
        //
        tableView.delegate = self  // el delegate debe adoptar el protocolo de UITableViewDelegate protocol.
        
        // UITableViewDelegate
        
        // Tiene metodos para manejar selecciones, configurar sectiones de encabezado y pie de pagina, borrar y reordenar celdas y la performance de otras acciones en un tableViiew
    
        tableView.dataSource = self // el dataSource debe adoptar el protocolo de
       // UITableViewDataSource
        // UITableViewDataSourcee tiene metodos para administrar datos y proporcionar celdas para el tableview.

    }

}

extension ListCafeteriasViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->
    String?{
        
        //Pregunta al DataSource por el título del encabezado de la sección especificada del TableView.
        
        cafeterias.first?.nombre // Pone el nombre del primer local en la lista como cabecera
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Le dice al DataSource que devuelva el número de filas en una sección determinada de un TableView.
        
        return cafeterias.count // indica el numero de filas que habra en la sección
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Pide al DataSource que inserte una celda en una ubicación particular de la vista de tabla
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell
        
//        Devuelve un objeto de celda de TableView reutilizable para el identificador de reutilización especificado y lo agrega al tableView.
        
        
        // Obtiene los datos de cada elemento, es decir obtiene los datos de cada cafeteria por celda
        
        let dataDeLaCafeteria = cafeterias[indexPath.row]
        print("cafeterias \(cafeterias)")
        
        cell?.nameLocalCellLabel?.text = dataDeLaCafeteria.nombre.capitalized
        cell?.descriptioncellLabel?.text = "Distancia " + String(format : "%0.2f", dataDeLaCafeteria.distancia) + " km"
        cell?.estrellasCellLabel?.text = "Valoracion: " + String(dataDeLaCafeteria.estrellas) + "⭐️"
        cell?.direccionesCellLabel?.text = "📌:" + dataDeLaCafeteria.direccion
        
        // Obtenemos el url de cada cafeteria y los muestra a traves de UIImage
        
        if let url = URL(string: dataDeLaCafeteria.url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main threadself.imageView.image = UIImage(data: data)
                    cell?.imageCellView?.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        cell?.imageCellView?.image = UIImage()
    
        return cell!
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Le dice al Delegate que fila ha sido seleccionada.
        performSegue(withIdentifier: "showmecoordenates", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MapViewController {
            destination.locales = cafeterias[(tableView.indexPathForSelectedRow?.row)!]

        }
    }
    
}


