//
//  FoodService.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import Foundation
import Alamofire

protocol FoodListServiceable {
  func getFoodList(onComplete: @escaping (Result<FoodListResponse, PCError>) -> Void)
}

class FoodListService: FoodListServiceable {
  
  let requestor: Requestable
  let baseURL = "http://localhost:3002"
  
  init(requestor: Requestable = NetworkRequest()) {
    self.requestor = requestor
  }
  
  func getFoodList(onComplete: @escaping (Result<FoodListResponse, PCError>) -> Void) {
    requestor.request("\(baseURL)/menu", method: .get, params: [:], onComplete: onComplete)
  }
}



