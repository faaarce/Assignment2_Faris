//
//  CartViewController.swift
//  Restaurante
//
//  Created by yoga arie on 09/07/24.
//

import UIKit

class CartViewController: UIViewController {
  let defaults = UserDefaults.standard
  var cartService = CartService()
  var orderFoodService = OrderFoodService()
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "cell_cart")
    loadCartData()
  }
  
  func loadCartData() {
    
    if let cartData = defaults.object(forKey: "SavedCart") as? Data {
      let decoder = JSONDecoder()
      if let cartItem = try? decoder.decode([CartItem].self, from: cartData) {
        for item in cartItem {
          self.orderFoodService.addCartItem(item)
          self.tableView.reloadData()
        }
      }
    }
    
  }
  
}

extension CartViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orderFoodService.cartService.cartItemsArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell_cart", for: indexPath) as! CartTableViewCell
    let cart = orderFoodService.cartService.cartItemsArray[indexPath.row].food
    cell.nameLabel.text = cart.name
    cell.descriptionLabel.text = cart.description
    cell.priceLabel.text = String(cart.price)
    cell.amountLabel.text = String(orderFoodService.cartService.cartItemsArray[indexPath.row].amount)
    return cell
  }
}

extension UIViewController {
  func pushCartViewController() {
    let vc = CartViewController(nibName: "CartViewController", bundle: nil)
    navigationController?.pushViewController(vc, animated: true)
  }
}

