//
//  FoodViewCell.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import UIKit

class FoodViewCell: UITableViewCell {
  @IBOutlet weak var foodDescription: UILabel!
  
  @IBOutlet weak var foodPrice: UILabel!
  @IBOutlet weak var foodName: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
