//
//  CartService.swift
//  Restaurante
//
//  Created by yoga arie on 09/07/24.
//

import Foundation


class CartService {
  private var _listOfCart: Set<CartItem> {
    get {
      Set(listOfCart)
    }
    
    set {
      listOfCart = Array(newValue)
    }
  }
  
  private (set) var listOfCart: [CartItem] = []
  
  func addCart(_ cart: CartItem){
    _listOfCart.insert(cart)
    print(_listOfCart)
    print(_listOfCart.count)
  }
  
  func removeCart(_ cart: CartItem) {
    _listOfCart = _listOfCart.filter({
      $0.food.name == cart.food.name
    })
  }
  
  func updateAmount(_ indexPath: IndexPath) {
    listOfCart[indexPath.row].amount += 1
  }
  
  func reduceAmount(_ indexPath:IndexPath) {
    if listOfCart[indexPath.row].amount > 1 {
      listOfCart[indexPath.row].amount -= 1
    } else {
      listOfCart.remove(at: indexPath.row)
    }
    /*
     var amount = listOfCart[indexPath.row].amount
     if amount >= 0 {
     amount -= 1
     } else {
     listOfCart.remove(at: indexPath.row)
     }
     */
  }
}

