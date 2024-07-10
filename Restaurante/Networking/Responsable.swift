//
//  Responsable.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import Foundation

protocol Responseable: Codable {
  var message: String { get }
  var success: Bool { get }
}
