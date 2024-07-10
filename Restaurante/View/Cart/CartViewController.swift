//
//  CartViewController.swift
//  Restaurante
//
//  Created by yoga arie on 09/07/24.
//

import UIKit

class CartViewController: UIViewController {
  
  let defaults = UserDefaults.standard
  
  let orderFoodService: OrderFoodService
  @IBOutlet weak var tableView: UITableView!
  
  init(orderFoodService: OrderFoodService) {
    self.orderFoodService = orderFoodService
    super.init(nibName: "CartViewController", bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    
    tableView.register(UINib(nibName: "FoodViewCell", bundle: nil), forCellReuseIdentifier: "cell_cart")
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
    return orderFoodService.cartService.listOfCart.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell_cart", for: indexPath) as! FoodViewCell
    
    let cart = orderFoodService.cartService.listOfCart[indexPath.row].food
    cell.foodName.text = cart.name
    cell.foodDescription.text = cart.description
    cell.foodDescription.text = String(cart.price)
    cell.quantityLabel.text = String(orderFoodService.cartService.listOfCart[indexPath.row].amount)
    print("test \(cart.name) \(cart.id)")
    cell.delegate = self
    cell.indexPath = indexPath
    return cell
  }
}


extension CartViewController: FoodViewCellDelegate {
  func minusButtonTapped(indexPath: IndexPath) {
    print("TEST")
    self.orderFoodService.cartService.reduceAmount(indexPath)
    tableView.reloadData()
  }
  
  func plusButtonTapped(indexPath: IndexPath) {
    self.orderFoodService.cartService.updateAmount(indexPath)
    tableView.reloadData()
  }
  
}





