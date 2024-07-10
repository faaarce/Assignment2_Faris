//
//  FoodService.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import Foundation

class OrderFoodService {
  typealias FoodItem =  FoodListResponse.Food
  
  private (set) var foodList: [FoodListResponse.Food] = []
  
  let foodListService: FoodListServiceable
  
  var cartService: CartService
  // Mock Data Api for testing
  init(foodListService: FoodListServiceable = FoodListService(), cart: CartService = CartService()) {
    self.foodListService = foodListService
    self.cartService = cart
  }
  
  func getAllFood(onComplete: @escaping (Result<[FoodListResponse.Food], PCError>) -> Void) {
    foodListService.getFoodList { (result) in
      switch result {
      case .success(let success):
        self.foodList = success.data
        onComplete(.success(success.data))
      case .failure(let failure):
        onComplete(.failure(failure))
      }
    }
  }
  
  
  func addCartItem(_ cart: CartItem) {
    self.cartService.addCart(cart)
  }
  
  
  func addFood(foodItem: FoodItem) {
    self.foodList.append(foodItem)
  }
  
}


// addToCart
