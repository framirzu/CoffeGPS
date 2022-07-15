//
//  CustomTableViewCell.swift
//  CoffeGPS
//
//  Created by Franzua Renzo Ramirez Gaston Zuloeta on 8/07/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCellView: UIImageView!
    @IBOutlet weak var nameLocalCellLabel: UILabel!
    @IBOutlet weak var descriptioncellLabel: UILabel!
    @IBOutlet weak var estrellasCellLabel: UILabel!
    @IBOutlet weak var direccionesCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected( selected, animated: animated)

        // Configure the view for the selected state
    }

}
