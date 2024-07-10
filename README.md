# Restaurante

## Overview
Restaurante is an iOS application built using UIKit. It showcases a list of foods, allows users to add food items to a cart, and persist data using UserDefaults. The app fetches food data from a mock server using Mockoon and Alamofire.

## Features
- Display a list of foods using UITableView
- Add food items to the cart
- Display the number of items in the cart with a badge on the cart button
- Persist food and cart data using UserDefaults
- Fetch food data from a mock server using Mockoon and Alamofire

## Requirements
- iOS 17.0+
- Xcode 14+
- Swift 5.0+

## Installation

### Clone the repository
```bash
git clone https://github.com/faaarce/Restaurante.git
Restaurante

Update the API base URL
In your project, update the base URL for your API calls to match the URL provided by Mockoon. For example, if Mockoon runs on http://localhost:3000, update your API client accordingly.

Usage

Running the App
Open Restaurante.xcworkspace in Xcode.
Select your target device or simulator.
Click the Run button or press Cmd+R to build and run the app.
Project Structure

ViewControllers
ViewController: Displays the list of foods and handles adding items to the cart.
CartViewController: Displays the items in the cart.
Models
FoodItem: Represents a food item.
CartItem: Represents an item in the cart.
Services
FoodListService: Handles fetching food data from the server.
OrderFoodService: Manages food items and cart items.
Utilities
UserDefaults: Used for persisting data locally.
Dependencies

Alamofire: For networking.
Mockoon: For mocking the backend server.
License

This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgements

Alamofire
Mockoon
