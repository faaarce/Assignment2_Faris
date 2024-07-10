//
//  FoodViewCell.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import UIKit

protocol FoodViewCellDelegate {
  func minusButtonTapped(indexPath: IndexPath)
  func plusButtonTapped(indexPath: IndexPath)
}

class FoodViewCell: UITableViewCell {
  @IBOutlet weak var foodDescription: UILabel!
  
  @IBOutlet weak var quantityLabel: UILabel!
  @IBOutlet weak var foodPrice: UILabel!
  @IBOutlet weak var foodName: UILabel!
  
  var delegate: FoodViewCellDelegate?
  var indexPath: IndexPath?
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  @IBAction func minusButtonTapped(_ sender: Any) {
    guard let safeIndexPath = indexPath else {
            print("IndexPath is nil")
            return
        }
        delegate?.minusButtonTapped(indexPath: safeIndexPath)
  }
  
  @IBAction func plusButtonTapped(_ sender: Any) {
    guard let safeIndexPath = indexPath else {
            print("IndexPath is nil")
            return
        }
        delegate?.plusButtonTapped(indexPath: safeIndexPath)
  }
  
  
}
