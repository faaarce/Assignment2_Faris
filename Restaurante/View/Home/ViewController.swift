//
//  ViewController.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import UIKit

class ViewController: UIViewController {
  let defaults = UserDefaults.standard
  
  @IBOutlet weak var cartButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  let orderFoodService: OrderFoodService = OrderFoodService()
  
  lazy var badgeLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
    label.translatesAutoresizingMaskIntoConstraints = false
    label.layer.cornerRadius = label.bounds.size.height / 2
    label.textAlignment = .center
    label.layer.masksToBounds = true
    label.textColor = .white
    label.font = label.font.withSize(12)
    label.backgroundColor = .systemRed
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    loadData()
    loadCartData()
    foodList()
  }
  
  func setupUI(){
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "food_cell")
  }
  
  func loadData() {
    if let savedFood = defaults.object(forKey: "SavedFoods") as? Data {
      let decoder = JSONDecoder()
      if let foodItem = try? decoder.decode([OrderFoodService.FoodItem].self, from: savedFood) {
        for item in foodItem {
          self.orderFoodService.addFood(foodItem: item)
          self.tableView.reloadData()
        }
      }
    }
    
  }
  
  func loadCartData() {
    
    if let cartData = defaults.object(forKey: "SavedCart") as? Data {
      let decoder = JSONDecoder()
      if let cartItem = try? decoder.decode([CartItem].self, from: cartData) {
        for item in cartItem {
          self.orderFoodService.addCartItem(item)
          showBadge(count: self.orderFoodService.cartService.listOfCart.count)
          self.tableView.reloadData()
        }
      }
    }
    
  }
  
  
  func foodList() {
    
    orderFoodService.getAllFood { [weak self] result in
      switch result {
      case .success(_):
        self?.tableView.reloadData()
      case .failure(let error):
        print(error)
      }
    }
  }
  
  @IBAction func cartTapped(_ sender: Any) {
    pushCartViewController()
  }
  
  func pushCartViewController() {
    let vc = CartViewController(orderFoodService: orderFoodService)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func showBadge(count: Int) {
    badgeLabel.text = "\(count)"
    cartButton.addSubview(badgeLabel)
    let constraints = [
      badgeLabel.leftAnchor.constraint(equalTo: cartButton.centerXAnchor, constant: 0),
      badgeLabel.topAnchor.constraint(equalTo: cartButton.topAnchor, constant: -6),
      badgeLabel.widthAnchor.constraint(equalToConstant: 16),
      badgeLabel.heightAnchor.constraint(equalToConstant: 16)
    ]
    NSLayoutConstraint.activate(constraints)
  }
  
  @IBAction func addCart(_ sender: Any) {
    let alert = UIAlertController(title: "Add to Cart", message: "Enter item details you want to add to the cart", preferredStyle: .alert)
    alert.addTextField { (name) in
      name.placeholder = "Insert the item name here"
    }
    
    alert.addTextField { (amount) in
      amount.placeholder = "Quantity"
      
    }
    
    alert.addTextField { (price) in
      price.placeholder = "Price"
    }
    
    alert.addTextField { (description) in
      description.placeholder = "Description"
    }
    
    alert.addAction(UIAlertAction(title: "Insert Item", style: .default)  { _ in
      let name = alert.textFields?[0].text ?? ""
      let amount = alert.textFields?[1].text ?? ""
      let price = alert.textFields?[2].text ?? ""
      let desc = alert.textFields?[3].text ?? ""
      
      let foodItem = OrderFoodService.FoodItem(name: name,
                                               price: Int(price) ?? 0,
                                               description: desc)
      
      self.orderFoodService.addFood(foodItem: foodItem)
      
      
      var foodItems = [OrderFoodService.FoodItem]()
      if let savedFood = self.defaults.object(forKey: "SavedFoods") as? Data,
         let loadedFoodItems = try? JSONDecoder().decode([OrderFoodService.FoodItem].self, from: savedFood) {
        foodItems = loadedFoodItems
      }
      foodItems.append(foodItem)
      
      
      if let encoded = try? JSONEncoder().encode(foodItems) {
        UserDefaults.standard.set(encoded, forKey: "SavedFoods")
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    })
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(alert, animated: true)
    
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return orderFoodService.foodList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as! CartTableViewCell
    let foodData = orderFoodService.foodList[indexPath.row]
    cell.nameLabel.text = foodData.name
    cell.priceLabel.text = "Rp. \(foodData.price)"
    cell.descriptionLabel.text = foodData.description
    
    return cell
  }
}

/*
 extension ViewController: FoodViewCellDelegate {
 func minusButtonTapped(indexPath: IndexPath) {
 
 }
 
 func plusButtonTapped(indexPath: IndexPath) {
 
 let foods = orderFoodService.foodList[indexPath.row]
 let itemCart =  CartItem(
 food: FoodListResponse.Food(
 name: foods.name,
 price: foods.price,
 description: foods.description),
 amount: 1)
 orderFoodService.addCartItem(itemCart) // Input ke source of truth
 
 var cartItems = [CartItem]()
 if let cartItem = self.defaults.object(forKey: "SavedCart") as? Data,
 let loadedCartItems = try? JSONDecoder().decode([CartItem].self, from: cartItem) {
 cartItems = loadedCartItems // Ini dari user default
 }
 
 cartItems.append(itemCart) // Ini dari item yang baru diinput
 
 // digabungin dimasukkin ke user default lagi
 
 if let encoded = try? JSONEncoder().encode(cartItems) {
 defaults.set(encoded, forKey: "SavedCart") // Input ke user default
 }
 
 
 showBadge(count: orderFoodService.cartService.listOfCart.count)
 }
 
 
 }
 */

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let food = orderFoodService.foodList[indexPath.row]
    let itemCart =  CartItem(
      food: food,
      amount: 1)
    orderFoodService.addCartItem(itemCart)
    
    var cartItems = [CartItem]()
    
    if let cartItem = self.defaults.object(forKey: "SavedCart") as? Data,
       let loadedCartItems = try? JSONDecoder().decode([CartItem].self, from: cartItem) {
      cartItems = loadedCartItems
    }
    
    cartItems.append(itemCart)
    
    if let encoded = try? JSONEncoder().encode(cartItems) {
      UserDefaults.standard.set(encoded, forKey: "SavedCart")
    }
    
    
    showBadge(count: orderFoodService.cartService.listOfCart.count)
  }
}

