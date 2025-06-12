//
//  RestaurantData.swift
//  appdesign
//
//  Created by Yizhen Zhu - 143 on 2025-05-06.
//

import Foundation

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var tags: [String]
    var menu: [String]
    var menuPrices: [String: Double]

    func price(for foodItem: String) -> String {
        if let price = menuPrices[foodItem] {
            return String(format: "$%.2f", price)
        }
        return "$0.00"
    }
}


let sampleRestaurants: [Restaurant] = [
    Restaurant(name: "McDonald's", tags: [
        "burger", "fast food", "american", "fries", "coca cola", "coke",
        "chicken nuggets", "breakfast", "dessert", "big mac", "combo meals",
        "beef", "cheeseburger", "kids", "value menu"
    ], menu: [
        "Big Mac", "McChicken", "Quarter Pounder", "Chicken Nuggets",
        "Filet-O-Fish", "Fries", "Egg McMuffin", "Sausage Biscuit",
        "Apple Pie", "McFlurry"
    ], menuPrices: [
        "Big Mac": 5.99, "McChicken": 3.49, "Quarter Pounder": 6.49, "Chicken Nuggets": 4.99,
        "Filet-O-Fish": 4.79, "Fries": 1.99, "Egg McMuffin": 3.99, "Sausage Biscuit": 2.79,
        "Apple Pie": 1.29, "McFlurry": 3.49
    ]),
    
    Restaurant(name: "Pizza Hut", tags: [
        "pizza", "italian", "fast food", "coca cola", "cheese", "pepperoni",
        "wings", "pasta", "breadsticks", "family", "stuffed crust",
        "dinner", "soda", "vegetarian"
    ], menu: [
        "Pepperoni Pizza", "Cheese Pizza", "Stuffed Crust Pizza", "Meat Lover's",
        "Veggie Lover's", "BBQ Chicken Pizza", "Wings", "Garlic Bread",
        "Pasta Alfredo", "Brownie Bites"
    ], menuPrices: [
        "Pepperoni Pizza": 12.99, "Cheese Pizza": 10.99, "Stuffed Crust Pizza": 14.99,
        "Meat Lover's": 13.99, "Veggie Lover's": 11.99, "BBQ Chicken Pizza": 13.49,
        "Wings": 7.99, "Garlic Bread": 4.99, "Pasta Alfredo": 8.49, "Brownie Bites": 3.99
    ]),
    
    Restaurant(name: "Taco Bell", tags: [
        "mexican", "fast food", "tacos", "burrito", "nachos", "quesadilla",
        "spicy", "crunchwrap", "cheesy", "beef", "chicken", "vegetarian options",
        "late night", "soda"
    ], menu: [
        "Crunchwrap Supreme", "Beef Burrito", "Chicken Quesadilla", "Cheesy Gordita Crunch",
        "Nacho BellGrande", "Soft Tacos", "Hard Shell Tacos", "Chalupa Supreme",
        "Cinnamon Twists", "Mountain Dew Baja Blast"
    ], menuPrices: [
        "Crunchwrap Supreme": 5.99, "Beef Burrito": 3.49, "Chicken Quesadilla": 4.49,
        "Cheesy Gordita Crunch": 4.99, "Nacho BellGrande": 6.49, "Soft Tacos": 1.79,
        "Hard Shell Tacos": 1.79, "Chalupa Supreme": 4.59, "Cinnamon Twists": 2.49,
        "Mountain Dew Baja Blast": 1.89
    ]),
    
    Restaurant(name: "Burger King", tags: [
        "burger", "fast food", "american", "whopper", "grilled", "fries",
        "onion rings", "coca cola", "breakfast", "value menu", "milkshake",
        "cheeseburger", "beef", "dessert", "chicken sandwich"
    ], menu: [
        "Whopper", "Bacon King", "Chicken Fries", "Impossible Whopper",
        "Classic Fries", "Onion Rings", "Double Cheeseburger", "Croissan'wich",
        "Pancake Platter", "Vanilla Shake"
    ], menuPrices: [
        "Whopper": 5.99, "Bacon King": 6.99, "Chicken Fries": 4.49, "Impossible Whopper": 6.49,
        "Classic Fries": 2.49, "Onion Rings": 2.49, "Double Cheeseburger": 3.99, "Croissan'wich": 3.49,
        "Pancake Platter": 4.99, "Vanilla Shake": 3.49
    ]),
    
    Restaurant(name: "Subway", tags: [
        "sandwich", "healthy", "american", "sub", "salad", "fresh", "vegetarian",
        "customizable", "low calorie", "meal deal", "cold cuts", "wrap",
        "lunch", "chicken", "vegan options"
    ], menu: [
        "Italian B.M.T.", "Turkey Breast", "Veggie Delight", "Chicken Teriyaki",
        "Tuna", "Meatball Marinara", "Black Forest Ham", "Steak & Cheese",
        "Rotisserie-Style Chicken", "Oven Roasted Chicken"
    ], menuPrices: [
        "Italian B.M.T.": 5.99, "Turkey Breast": 5.49, "Veggie Delight": 4.99, "Chicken Teriyaki": 6.49,
        "Tuna": 5.99, "Meatball Marinara": 5.49, "Black Forest Ham": 5.49, "Steak & Cheese": 6.99,
        "Rotisserie-Style Chicken": 6.49, "Oven Roasted Chicken": 5.99
    ]),
    Restaurant(name: "Domino's Pizza", tags: [
           "pizza", "fast food", "italian", "pepperoni", "cheese", "stuffed crust",
           "wings", "garlic bread", "dessert", "combo meals", "vegetarian options",
           "dinner", "soda", "chicken", "crust options"
       ], menu: [
           "Hand Tossed Pizza", "Crunchy Thin Crust", "Cheese Pizza", "Pepperoni Pizza",
           "ExtravaganZZa Feast", "Buffalo Wings", "Garlic Breadsticks", "Chocolate Lava Crunch Cake",
           "Cinna Stix", "Philly Cheese Steak Pizza"
       ], menuPrices: [
           "Hand Tossed Pizza": 11.99, "Crunchy Thin Crust": 10.99, "Cheese Pizza": 9.99,
           "Pepperoni Pizza": 12.49, "ExtravaganZZa Feast": 15.99, "Buffalo Wings": 7.99,
           "Garlic Breadsticks": 4.99, "Chocolate Lava Crunch Cake": 3.49, "Cinna Stix": 3.99,
           "Philly Cheese Steak Pizza": 14.49
       ]),

       Restaurant(name: "Green Garden", tags: [
           "vegetarian", "vegan", "healthy", "organic", "plant-based", "salads",
           "wraps", "smoothies", "fresh", "eco-friendly", "non-GMO", "gluten-free"
       ], menu: [
           "Vegan Burger", "Falafel Wrap", "Avocado Salad", "Tofu Stir Fry",
           "Vegan Burrito", "Smoothie Bowl", "Lentil Soup", "Quinoa Salad",
           "Vegan Pizza", "Chia Pudding"
       ], menuPrices: [
           "Vegan Burger": 7.99, "Falafel Wrap": 6.99, "Avocado Salad": 5.49, "Tofu Stir Fry": 8.49,
           "Vegan Burrito": 7.49, "Smoothie Bowl": 6.99, "Lentil Soup": 4.99, "Quinoa Salad": 6.49,
           "Vegan Pizza": 9.99, "Chia Pudding": 3.99
       ]),

       Restaurant(name: "Spicy Masala", tags: [
           "indian", "spicy", "curry", "naan", "tandoori", "biryani",
           "chicken tikka", "vegetarian options", "dal", "paneer", "rice", "chai"
       ], menu: [
           "Butter Chicken", "Chicken Tikka Masala", "Paneer Butter Masala", "Lamb Biryani",
           "Dal Makhani", "Chana Masala", "Tandoori Chicken", "Naan",
           "Aloo Gobi", "Raita"
       ], menuPrices: [
           "Butter Chicken": 12.99, "Chicken Tikka Masala": 11.49, "Paneer Butter Masala": 10.99,
           "Lamb Biryani": 14.99, "Dal Makhani": 7.99, "Chana Masala": 6.99, "Tandoori Chicken": 13.49,
           "Naan": 2.99, "Aloo Gobi": 6.49, "Raita": 2.49
       ]),

       Restaurant(name: "Sushi World", tags: [
           "japanese", "sushi", "sashimi", "ramen", "noodles", "tempura",
           "miso soup", "teriyaki", "rice bowl", "healthy", "seafood"
       ], menu: [
           "California Roll", "Spicy Tuna Roll", "Salmon Nigiri", "Shrimp Tempura Roll",
           "Miso Soup", "Edamame", "Rainbow Roll", "Chicken Teriyaki",
           "Unagi Sushi", "Vegetarian Rolls"
       ], menuPrices: [
           "California Roll": 8.99, "Spicy Tuna Roll": 10.99, "Salmon Nigiri": 6.99,
           "Shrimp Tempura Roll": 9.99, "Miso Soup": 2.49, "Edamame": 3.49,
           "Rainbow Roll": 12.99, "Chicken Teriyaki": 11.49, "Unagi Sushi": 7.99,
           "Vegetarian Rolls": 6.49
       ]),

       Restaurant(name: "The Steakhouse", tags: [
           "beef", "steak", "american", "grill", "ribs", "burgers", "bbq",
           "mashed potatoes", "salad", "wine", "dinner", "premium"
       ], menu: [
           "Filet Mignon", "Ribeye Steak", "T-bone Steak", "BBQ Ribs",
           "Grilled Salmon", "Cheeseburger", "Mashed Potatoes", "Grilled Asparagus",
           "Caesar Salad", "House Wine"
       ], menuPrices: [
           "Filet Mignon": 24.99, "Ribeye Steak": 22.99, "T-bone Steak": 26.99,
           "BBQ Ribs": 19.99, "Grilled Salmon": 18.99, "Cheeseburger": 8.49,
           "Mashed Potatoes": 3.49, "Grilled Asparagus": 5.99, "Caesar Salad": 6.99,
           "House Wine": 8.99
       ]),

       Restaurant(name: "Mediterraneo", tags: [
           "mediterranean", "greek", "falafel", "hummus", "pita", "lamb",
           "olives", "healthy", "grilled", "vegetarian", "tzatziki", "salad"
       ], menu: [
           "Falafel Wrap", "Hummus with Pita", "Greek Salad", "Lamb Gyro",
           "Chicken Souvlaki", "Baklava", "Tabbouleh", "Pita Bread",
           "Dolmas", "Tzatziki Sauce"
       ], menuPrices: [
           "Falafel Wrap": 7.49, "Hummus with Pita": 5.99, "Greek Salad": 6.99, "Lamb Gyro": 9.99,
           "Chicken Souvlaki": 8.49, "Baklava": 3.49, "Tabbouleh": 4.99, "Pita Bread": 2.49,
           "Dolmas": 4.49, "Tzatziki Sauce": 1.99
       ]),

       Restaurant(name: "Vegan Vibes", tags: [
           "vegan", "plant-based", "cruelty-free", "healthy", "salad", "smoothies",
           "organic", "no dairy", "gluten-free", "eco-friendly"
       ], menu: [
           "Vegan Burger", "Vegan Burrito", "Lentil Soup", "Avocado Toast",
           "Smoothie Bowl", "Tofu Stir Fry", "Chia Pudding", "Vegan Tacos",
           "Sweet Potato Fries", "Vegan Pizza"
       ], menuPrices: [
           "Vegan Burger": 8.99, "Vegan Burrito": 7.49, "Lentil Soup": 5.49,
           "Avocado Toast": 6.99, "Smoothie Bowl": 7.99, "Tofu Stir Fry": 9.49,
           "Chia Pudding": 4.99, "Vegan Tacos": 6.49, "Sweet Potato Fries": 3.99,
           "Vegan Pizza": 10.99
       ]),
    Restaurant(name: "BBQ Barn", tags: [
        "bbq", "grilled", "beef", "ribs", "steak", "american", "cornbread",
        "coleslaw", "smoked", "meat lovers"
    ], menu: [
        "Pulled Pork Sandwich", "Baby Back Ribs", "Beef Brisket", "BBQ Chicken",
        "Cornbread", "Coleslaw", "Grilled Vegetables", "Mac n' Cheese",
        "Smoked Sausage", "BBQ Combo Platter"
    ], menuPrices: [
        "Pulled Pork Sandwich": 8.99, "Baby Back Ribs": 15.99, "Beef Brisket": 14.99,
        "BBQ Chicken": 9.99, "Cornbread": 2.49, "Coleslaw": 3.49, "Grilled Vegetables": 4.99,
        "Mac n' Cheese": 5.49, "Smoked Sausage": 7.99, "BBQ Combo Platter": 18.99
    ]),

    Restaurant(name: "Curry Kingdom", tags: [
        "indian", "curry", "masala", "spicy", "naan", "vegetarian", "butter chicken",
        "paneer", "rice", "biryani", "chai"
    ], menu: [
        "Butter Chicken", "Paneer Tikka", "Chana Masala", "Lamb Biryani",
        "Tandoori Chicken", "Garlic Naan", "Dal Tadka", "Samosa",
        "Raita", "Aloo Gobi"
    ], menuPrices: [
        "Butter Chicken": 11.99, "Paneer Tikka": 8.99, "Chana Masala": 7.49,
        "Lamb Biryani": 12.99, "Tandoori Chicken": 10.99, "Garlic Naan": 2.99,
        "Dal Tadka": 6.99, "Samosa": 3.49, "Raita": 1.99, "Aloo Gobi": 5.99
    ]),

    Restaurant(name: "Ramen Republic", tags: [
       "japanese", "ramen", "noodles", "umami", "broth", "pork", "egg",
       "miso", "spicy", "quick bite"
    ], menu: [
       "Shoyu Ramen", "Miso Ramen", "Tonkotsu Ramen", "Spicy Ramen",
       "Chashu Pork", "Egg Ramen", "Seafood Ramen", "Vegetarian Ramen",
       "Gyoza", "Chashu Rice"
    ], menuPrices: [
       "Shoyu Ramen": 9.99, "Miso Ramen": 10.49, "Tonkotsu Ramen": 11.49,
       "Spicy Ramen": 10.99, "Chashu Pork": 5.99, "Egg Ramen": 4.49,
       "Seafood Ramen": 12.49, "Vegetarian Ramen": 8.99, "Gyoza": 6.49,
       "Chashu Rice": 3.99
    ]),

    Restaurant(name: "Falafel Feast", tags: [
       "mediterranean", "falafel", "hummus", "pita", "vegetarian", "middle eastern",
       "healthy", "grilled", "tahini", "wrap"
    ], menu: [
       "Falafel Wrap", "Hummus and Pita", "Falafel Salad", "Shawarma",
       "Pita Bread", "Tahini Sauce", "Falafel Plate", "Falafel Burger",
       "Vegetarian Wrap", "Tabbouleh"
    ], menuPrices: [
       "Falafel Wrap": 6.99, "Hummus and Pita": 4.99, "Falafel Salad": 7.49,
       "Shawarma": 8.49, "Pita Bread": 1.99, "Tahini Sauce": 1.49,
       "Falafel Plate": 8.99, "Falafel Burger": 7.99, "Vegetarian Wrap": 7.49,
       "Tabbouleh": 4.99
    ]),

    Restaurant(name: "Pancake Place", tags: [
       "breakfast", "pancakes", "syrup", "eggs", "brunch", "bacon", "american",
       "coffee", "waffles", "sweet"
    ], menu: [
       "Classic Pancakes", "Waffles", "Eggs Benedict", "French Toast",
       "Breakfast Burrito", "Bacon and Eggs", "Belgian Waffle",
       "Omelette", "Pancake Stack", "Cinnamon Roll"
    ], menuPrices: [
       "Classic Pancakes": 6.99, "Waffles": 7.49, "Eggs Benedict": 9.99,
       "French Toast": 7.99, "Breakfast Burrito": 8.49, "Bacon and Eggs": 6.49,
       "Belgian Waffle": 8.99, "Omelette": 7.99, "Pancake Stack": 8.49,
       "Cinnamon Roll": 3.99
    ]),

    Restaurant(name: "Seaside Sushi", tags: [
       "sushi", "japanese", "seafood", "raw", "wasabi", "rice", "healthy",
       "miso soup", "sashimi", "rolls"
    ], menu: [
       "California Roll", "Tuna Sashimi", "Salmon Nigiri", "Rainbow Roll",
       "Spicy Tuna Roll", "Shrimp Tempura Roll", "Miso Soup", "Edamame",
       "Unagi Don", "Vegetarian Roll"
    ], menuPrices: [
       "California Roll": 8.99, "Tuna Sashimi": 10.49, "Salmon Nigiri": 6.99,
       "Rainbow Roll": 12.49, "Spicy Tuna Roll": 9.99, "Shrimp Tempura Roll": 10.99,
       "Miso Soup": 2.49, "Edamame": 3.49, "Unagi Don": 11.49,
       "Vegetarian Roll": 7.99
    ]),

    Restaurant(name: "Tandoori Twist", tags: [
       "indian", "tandoori", "chicken", "spicy", "naan", "biryani", "curry",
       "rice", "grilled", "lunch"
    ], menu: [
       "Chicken Tandoori", "Lamb Biryani", "Paneer Butter Masala", "Butter Chicken",
       "Tandoori Naan", "Aloo Gobi", "Palak Paneer", "Garlic Naan",
       "Chicken Kebab", "Tandoori Fish"
    ], menuPrices: [
       "Chicken Tandoori": 11.99, "Lamb Biryani": 13.49, "Paneer Butter Masala": 10.99,
       "Butter Chicken": 12.49, "Tandoori Naan": 2.99, "Aloo Gobi": 6.49,
       "Palak Paneer": 7.99, "Garlic Naan": 3.49, "Chicken Kebab": 9.99,
       "Tandoori Fish": 13.99
    ]),

    Restaurant(name: "FitFuel Café", tags: [
       "healthy", "low calorie", "salad", "smoothie", "wraps", "protein", "vegan",
       "fresh", "organic", "fitness"
    ], menu: [
       "Chicken Wrap", "Smoothie Bowl", "Vegan Salad", "Tofu Stir Fry",
       "Avocado Toast", "Protein Shake", "Quinoa Salad", "Fruit Parfait",
       "Chia Pudding", "Grilled Salmon"
    ], menuPrices: [
       "Chicken Wrap": 8.99, "Smoothie Bowl": 7.49, "Vegan Salad": 6.99,
       "Tofu Stir Fry": 9.49, "Avocado Toast": 6.49, "Protein Shake": 5.99,
       "Quinoa Salad": 7.99, "Fruit Parfait": 4.99, "Chia Pudding": 3.99,
       "Grilled Salmon": 12.99
    ]),

    Restaurant(name: "Classic Deli", tags: [
        "sandwich", "sub", "meat", "cheese", "pickle", "lunch", "wrap", "cold cuts",
        "bagel", "american"
    ], menu: [
        "Turkey Sub", "Ham and Cheese Sandwich", "Chicken Caesar Wrap", "Club Sandwich",
        "Roast Beef Sandwich", "Bagel with Cream Cheese", "BLT Sandwich",
        "Veggie Sub", "Chicken Salad", "Grilled Cheese"
    ], menuPrices: [
        "Turkey Sub": 7.99, "Ham and Cheese Sandwich": 6.49, "Chicken Caesar Wrap": 8.49,
        "Club Sandwich": 7.99, "Roast Beef Sandwich": 8.99, "Bagel with Cream Cheese": 3.49,
        "BLT Sandwich": 6.99, "Veggie Sub": 5.99, "Chicken Salad": 7.49, "Grilled Cheese": 4.99
    ]),

    Restaurant(name: "Chipotle", tags: [
        "mexican", "burrito", "bowl", "tacos", "fast casual", "healthy", "rice", "beans",
        "grilled", "customizable", "guacamole", "vegetarian", "vegan options"
    ], menu: [
        "Burrito", "Bowl", "Tacos", "Quesadilla", "Guacamole",
        "Chips and Salsa", "Fajita Veggies", "Steak Burrito", "Chicken Bowl",
        "Carnitas Tacos"
    ], menuPrices: [
        "Burrito": 8.99, "Bowl": 7.99, "Tacos": 6.49, "Quesadilla": 7.49, "Guacamole": 2.00,
        "Chips and Salsa": 3.49, "Fajita Veggies": 1.00, "Steak Burrito": 9.49,
        "Chicken Bowl": 8.49, "Carnitas Tacos": 6.99
    ]),

    Restaurant(name: "KFC", tags: [
        "fried chicken", "fast food", "american", "bucket", "coleslaw", "biscuits",
        "combo meals", "chicken sandwich", "gravy", "soda"
    ], menu: [
        "Bucket of Chicken", "Original Recipe Chicken", "Chicken Sandwich", "Popcorn Chicken",
        "Mashed Potatoes", "Biscuits", "Gravy", "Coleslaw", "Mac and Cheese",
        "Chicken Tenders"
    ], menuPrices: [
        "Bucket of Chicken": 19.99, "Original Recipe Chicken": 9.99, "Chicken Sandwich": 5.99,
        "Popcorn Chicken": 6.49, "Mashed Potatoes": 2.99, "Biscuits": 1.49,
        "Gravy": 1.00, "Coleslaw": 2.49, "Mac and Cheese": 3.99, "Chicken Tenders": 7.49
    ]),

    Restaurant(name: "Panda Express", tags: [
        "chinese", "asian", "orange chicken", "rice", "noodles", "teriyaki", "wok",
        "fast food", "spicy", "combo", "spring rolls"
    ], menu: [
        "Orange Chicken", "Beijing Beef", "Kung Pao Chicken", "Sweet and Sour Chicken",
        "Spring Rolls", "Chow Mein", "Fried Rice", "Egg Rolls", "Teriyaki Chicken",
        "Grilled Veggie Skewers"
    ], menuPrices: [
        "Orange Chicken": 8.99, "Beijing Beef": 9.49, "Kung Pao Chicken": 8.49,
        "Sweet and Sour Chicken": 8.99, "Spring Rolls": 3.49, "Chow Mein": 4.49,
        "Fried Rice": 3.99, "Egg Rolls": 2.99, "Teriyaki Chicken": 7.99,
        "Grilled Veggie Skewers": 5.99
    ]),

    Restaurant(name: "Five Guys", tags: [
        "burger", "fries", "fast food", "american", "cheeseburger", "grilled",
        "peanuts", "milkshake", "customizable", "bacon"
    ], menu: [
        "Cheeseburger", "Bacon Burger", "Hot Dog", "Five Guys Fries",
        "Milkshake", "Grilled Cheese", "Veggie Sandwich", "Cajun Fries",
        "Peanut Butter Milkshake", "Hamburger"
    ], menuPrices: [
        "Cheeseburger": 7.99, "Bacon Burger": 8.49, "Hot Dog": 4.99,
        "Five Guys Fries": 3.99, "Milkshake": 5.99, "Grilled Cheese": 4.49,
        "Veggie Sandwich": 5.99, "Cajun Fries": 4.49, "Peanut Butter Milkshake": 6.49,
        "Hamburger": 6.49
    ]),

    Restaurant(name: "Starbucks", tags: [
        "coffee", "breakfast", "pastry", "frappuccino", "latte", "tea",
        "sandwich", "bakery", "vegan options", "café"
    ], menu: [
        "Caffè Latte", "Espresso", "Cappuccino", "Americano", "Frappuccino",
        "Pastry", "Bagels", "Vegan Wrap", "Egg Sandwich", "Smoothie"
    ], menuPrices: [
        "Caffè Latte": 4.49, "Espresso": 2.99, "Cappuccino": 3.49, "Americano": 3.29,
        "Frappuccino": 5.49, "Pastry": 2.99, "Bagels": 1.99, "Vegan Wrap": 4.99,
        "Egg Sandwich": 3.49, "Smoothie": 5.29
    ]),

    Restaurant(name: "Nando's", tags: [
        "portuguese", "chicken", "spicy", "peri peri", "grilled", "rice",
        "salad", "fast casual", "lunch", "dinner"
    ], menu: [
        "Peri Peri Chicken", "Spicy Chicken Wrap", "Chicken Thighs", "Peri Fries",
        "Grilled Veggies", "Pita Bread", "Chicken Wings", "Rice Bowl",
        "Portuguese Salad", "Garlic Bread"
    ], menuPrices: [
        "Peri Peri Chicken": 10.99, "Spicy Chicken Wrap": 8.49, "Chicken Thighs": 9.49,
        "Peri Fries": 3.99, "Grilled Veggies": 4.49, "Pita Bread": 1.99,
        "Chicken Wings": 6.99, "Rice Bowl": 7.49, "Portuguese Salad": 5.99,
        "Garlic Bread": 2.99
    ]),

    Restaurant(name: "Jersey Mike's", tags: [
        "sandwich", "sub", "cold cuts", "wrap", "american", "lunch",
        "cheese", "deli", "customizable", "meat"
    ], menu: [
        "Turkey Sub", "Italian Sub", "Veggie Sub", "Chicken Caesar Wrap",
        "Club Sub", "Roast Beef Sub", "BLT", "Tuna Salad", "Pastrami Sandwich",
        "Cheese Steak Sub"
    ], menuPrices: [
        "Turkey Sub": 7.99, "Italian Sub": 8.49, "Veggie Sub": 6.99,
        "Chicken Caesar Wrap": 8.49, "Club Sub": 7.99, "Roast Beef Sub": 8.99,
        "BLT": 6.99, "Tuna Salad": 7.49, "Pastrami Sandwich": 8.99,
        "Cheese Steak Sub": 9.49
    ])
]
