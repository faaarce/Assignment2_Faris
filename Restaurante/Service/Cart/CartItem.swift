//
//  Cart.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import Foundation


struct CartItem: Equatable, Hashable, Codable {
  
  static func == (lhs: CartItem, rhs: CartItem) -> Bool {
    lhs.id == rhs.id
  }
  
  let id: String
  let food: FoodListResponse.Food
  var amount: Int
  
  init(food: FoodListResponse.Food, amount: Int) {
    self.id = food.id
    self.food = food
    self.amount = amount
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
   }
}


