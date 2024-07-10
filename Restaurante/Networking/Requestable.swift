//
//  Requestable.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//
import Alamofire
import Foundation

typealias Method = HTTPMethod
typealias URLConvertible = Alamofire.URLConvertible
typealias PCError = AFError

protocol Requestable {
  func request<T: Responseable>(_ url: URLConvertible, method: Method, params: [String: Any], onComplete: @escaping (Result<T, PCError>) -> Void)
}


class NetworkRequest: Requestable {
  // T = FoodListResponse = Reponseable 
  func request<T>(_ url: URLConvertible, method: Method, params: [String : Any], onComplete: @escaping (Result<T, PCError>) -> Void) where T : Responseable {
    
    AF.request(url, method: method, parameters: params)
      .responseDecodable(of: T.self) { dataResponse in
        switch dataResponse.result {
        case .success(let value):
          onComplete(.success(value))
          
        case .failure(let error):
          onComplete(.failure(error))
        }
     }
  }
}
