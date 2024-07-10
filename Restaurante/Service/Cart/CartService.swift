//
//  CartService.swift
//  Restaurante
//
//  Created by yoga arie on 09/07/24.
//

import Foundation


class CartService {
  private (set) var listOfCart = Set<CartItem>()
  
  var cartItemsArray: [CartItem] {
    return Array(listOfCart)
  }
  
  func addCart(_ cart: CartItem){
    listOfCart.insert(cart)
    print(listOfCart)
    print(listOfCart.count)
  }
  
  func removeCart(_ cart: CartItem) {
    listOfCart = listOfCart.filter({
      $0.food.name == cart.food.name
    })
  }
}

