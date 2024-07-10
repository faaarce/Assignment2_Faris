//
//  Menu.swift
//  Restaurante
//
//  Created by yoga arie on 08/07/24.
//

import Foundation

struct FoodListResponse: Responseable {
  
  struct Food: Codable {
    let id: String = UUID().uuidString
    let name: String
    let price: Int
    let description: String
  }
  let data: [Food]
  let message: String
  let success: Bool
}



/*
 {
     "data": [
         {
             "name": "Nasi Goreng",
             "price": 35000,
             "description": "Indonesian fried rice with chicken, vegetables, and a fried egg on top."
         },
         {
             "name": "Sate Ayam",
             "price": 45000,
             "description": "Grilled chicken skewers served with peanut sauce."
         },
         {
             "name": "Martabak Manis",
             "price": 20000,
             "description": "Sweet pancake filled with chocolate, cheese, or nuts."
         },
         {
             "name": "Gado-Gado",
             "price": 30000,
             "description": "Mixed vegetable salad with peanut sauce dressing."
         },
         {
             "name": "Rendang",
             "price": 50000,
             "description": "Spicy beef stew slow-cooked in coconut milk and spices."
         },
         {
             "name": "Bakso",
             "price": 25000,
             "description": "Indonesian meatball soup with noodles and vegetables."
         },
         {
             "name": "Ayam Goreng",
             "price": 40000,
             "description": "Fried chicken served with rice and sambal."
         },
         {
             "name": "Mie Goreng",
             "price": 35000,
             "description": "Indonesian fried noodles with vegetables and meat."
         },
         {
             "name": "Pempek",
             "price": 30000,
             "description": "Fish cake served with spicy vinegar sauce."
         },
         {
             "name": "Soto Ayam",
             "price": 30000,
             "description": "Chicken soup with turmeric, vermicelli, and boiled eggs."
         },
         {
             "name": "Nasi Uduk",
             "price": 25000,
             "description": "Coconut rice served with fried chicken and sambal."
         },
         {
             "name": "Ketoprak",
             "price": 20000,
             "description": "Vegetable and tofu salad with peanut sauce and rice cakes."
         },
         {
             "name": "Lumpia",
             "price": 15000,
             "description": "Indonesian spring rolls filled with vegetables and meat."
         },
         {
             "name": "Bubur Ayam",
             "price": 20000,
             "description": "Chicken congee with fried shallots and soy sauce."
         },
         {
             "name": "Es Cendol",
             "price": 15000,
             "description": "Iced dessert with green rice flour jelly, coconut milk, and palm sugar syrup."
         },
         {
             "name": "Tahu Isi",
             "price": 10000,
             "description": "Fried tofu stuffed with vegetables."
         },
         {
             "name": "Tempe Mendoan",
             "price": 15000,
             "description": "Fried tempeh with a thin batter."
         },
         {
             "name": "Sate Kambing",
             "price": 50000,
             "description": "Grilled lamb skewers served with soy sauce."
         },
         {
             "name": "Gudeg",
             "price": 35000,
             "description": "Young jackfruit stew with coconut milk and spices."
         },
         {
             "name": "Kerak Telor",
             "price": 25000,
             "description": "Traditional Betawi omelette made from eggs and glutinous rice."
         },
         {
             "name": "Nasi Campur",
             "price": 40000,
             "description": "Mixed rice dish with various side dishes."
         },
         {
             "name": "Sop Buntut",
             "price": 60000,
             "description": "Oxtail soup with vegetables and potatoes."
         },
         {
             "name": "Es Teler",
             "price": 20000,
             "description": "Iced fruit cocktail with avocado, coconut, and jackfruit."
         },
         {
             "name": "Nasi Padang",
             "price": 45000,
             "description": "Rice with various Padang-style side dishes."
         },
         {
             "name": "Ayam Taliwang",
             "price": 50000,
             "description": "Spicy grilled chicken from Lombok."
         },
         {
             "name": "Sop Kaki Kambing",
             "price": 50000,
             "description": "Goat leg soup with a rich broth."
         },
         {
             "name": "Nasi Liwet",
             "price": 35000,
             "description": "Rice cooked in coconut milk served with side dishes."
         },
         {
             "name": "Tahu Gejrot",
             "price": 15000,
             "description": "Fried tofu in a sweet and spicy sauce."
         },
         {
             "name": "Babi Guling",
             "price": 80000,
             "description": "Balinese roasted pork dish."
         },
         {
             "name": "Ayam Betutu",
             "price": 60000,
             "description": "Balinese spiced roasted chicken."
         },
         {
             "name": "Klepon",
             "price": 10000,
             "description": "Sweet rice cake balls filled with palm sugar and coated in grated coconut."
         },
         {
             "name": "Cendol",
             "price": 15000,
             "description": "Iced dessert with green rice flour jelly, coconut milk, and palm sugar syrup."
         },
         {
             "name": "Nasi Kuning",
             "price": 25000,
             "description": "Yellow rice cooked with turmeric and coconut milk."
         },
         {
             "name": "Pisang Goreng",
             "price": 15000,
             "description": "Fried banana fritters."
         },
         {
             "name": "Rujak",
             "price": 20000,
             "description": "Fruit salad with a spicy tamarind dressing."
         },
         {
             "name": "Bubur Ketan Hitam",
             "price": 15000,
             "description": "Black glutinous rice porridge with coconut milk."
         },
         {
             "name": "Siomay",
             "price": 25000,
             "description": "Steamed fish dumplings served with peanut sauce."
         },
         {
             "name": "Pempek Palembang",
             "price": 30000,
             "description": "Fish cakes served with a spicy vinegar sauce."
         },
         {
             "name": "Sate Lilit",
             "price": 45000,
             "description": "Balinese minced meat satay wrapped around lemongrass sticks."
         },
         {
             "name": "Ayam Rica-Rica",
             "price": 40000,
             "description": "Spicy chicken dish from Manado."
         }
     ],
     "message": "Signup sucess, user created!",
     "success": true
 }
 */
