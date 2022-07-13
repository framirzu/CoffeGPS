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
        
        // Do any additional setup after loading the view.
    }

}

extension ListCafeteriasViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)->
    String?{
        
        cafeterias.first?.nombre
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as? CustomTableViewCell
        
    
        let cafe = cafeterias[indexPath.row]
        print("cafeterias \(cafeterias)")
        
        
        cell?.nameLocalCell?.text = cafe.nombre.capitalized
        cell?.descriptioncell?.text = "Distancia " + String(format : "%0.2f", cafe.distancia) + " km"
        cell?.estrellasCell?.text = "Valoracion: " + String(cafe.estrellas) + "⭐️"
        cell?.direccionesCell?.text = "📌:" + cafe.direccion
        
        
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
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //tableView.deselectRow(at: indexPath, animated: true)
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


