# Food Cart App

An iOS application built using UIKit. This app showcases a list of foods, allows users to add food items to a cart, and persists data using UserDefaults. The app fetches food data from a mock server using Mockoon and Alamofire.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Tech Stack](#tech-stack)
- [License](#license)

## Features

- **Display a list of foods**: Uses `UITableView` to show a list of available food items.
- **Add food items to the cart**: Users can add food items to their cart.
- **Cart badge**: Displays the number of items in the cart with a badge on the cart button.
- **Persist data**: Uses `UserDefaults` to persist food and cart data.
- **Fetch data**: Fetches food data from a mock server using Mockoon and Alamofire.

## Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/faaarce/Assignment2_Faris.git
   ```

2. **Open the project**
   Open the cloned repository in Xcode.

3. **Install dependencies**
   This project uses CocoaPods for dependency management. Run the following command to install the necessary dependencies:
   ```sh
   pod install
   ```

4. **Set up Mockoon**
   - Download and install [Mockoon](https://mockoon.com/).
   - Import the provided Mockoon configuration file into Mockoon to set up the mock server.
   - Start the mock server.

## Usage

Here is an example of how to use the Food Cart App:

1. **Display a list of foods**
   The app fetches food data from the mock server and displays it in a `UITableView`.

2. **Add food items to the cart**
   Tap on a food item to add it to the cart. The number of items in the cart will be displayed as a badge on the cart button.

3. **Persist data**
   The app uses `UserDefaults` to save the state of the food list and the cart. This ensures that data is persisted between app launches.

## Tech Stack

- **Language**: Swift
- **Framework**: UIKit
- **Networking**: Alamofire
- **Mock Server**: Mockoon
- **Persistence**: UserDefaults
- **Dependency Management**: CocoaPods

## License

This project is licensed under the WTFPL License - see the [WTFPL](https://en.wikipedia.org/wiki/WTFPL) file for details.
