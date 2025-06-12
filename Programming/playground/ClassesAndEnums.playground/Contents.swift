// MARK: - Welcome to Classes & Enums
// Let's explore the basics of Swift classes and enums!
// Follow along with the tasks below and modify the code to see how it works.

// MARK: - Classes

// Example: A simple Car class
class Car {
    var make: String
    var model: String
    var year: Int

    // Initializer to set up the car
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }

    // Method to describe the car
    func description() -> String {
        return "\(year) \(make) \(model)"
    }
}

let myCar = Car(make: "Tesla", model: "Model 3", year: 2020)
print(myCar.description())
// TASK 1: Create a Person class
// - Properties: name (String), age (Int)
// - A method called "greet()" that prints "Hello, my name is [name]."

// Uncomment below and complete!
class Person {
     // Add properties and methods here
    var name: String
    var age: Int
    var grade: Int
    let currentWeather: Weather
    init(name: String, age: Int, grade: Int, currentWeater: Weather)
    {
        self.name=name
        self.age=age
        self.grade=grade
        self.currentWeather=currentWeater
    }
    func greet()
    {
        print("Hello, my name is \(name), and i'm \(age) years old. My average grade is \(grade).")
    }
    func suggestActivity()
    {
        switch currentWeather
        {
        case .rainy:
            print("I should stay at home")
        case .sunny:
            print("I should go to the park")
        case .cloudy:
            print("I should go for a little walk")
        case .windy:
            print("I should stay at home")
        case .snowy:
            print("I should have a snowball fight with my friends")
        case .lightning:
            print("I should stay at home")
        case .overcast:
            print("I should stay at home")
        }
    }
}
let me = Person(name: "Yizhen", age: 16, grade: 90, currentWeater: .sunny)
me.greet()
me.suggestActivity()

// MARK: - Enums

// Example: Direction enum
enum Direction {
    case north
    case south
    case east
    case west
}

// Use an enum instance
let currentDirection = Direction.north
print("We are heading \(currentDirection).")

// TASK 2: Create a Weather enum
// - sunny, rainy, cloudy, stormy
// Write a function that gives advice based on the weather using a switch statement.

// Uncomment below and complete!
enum Weather {
    // Add cases here
    case rainy
    case sunny
    case cloudy
    case windy
    case snowy
    case lightning
    case overcast
}
let currentWeather: Weather = .cloudy
print("Today is a \(currentWeather) day.")

// MARK: - Combining Classes & Enums

// Example: Using enums in a class
class Journey {
    var destination: String
    var direction: Direction

    init(destination: String, direction: Direction) {
        self.destination = destination
        self.direction = direction
    }

    func journeyDetails() -> String {
        return "Heading \(direction) to \(destination)."
    }
}

// TASK 3: Combine Person and Weather
// Use the "Weather" enum as a parameter.

// MARK: - Advanced: Inheritance

// Example: Subclassing a class
class ElectricCar: Car {
    var batteryLife: Int

    init(make: String, model: String, year: Int, batteryLife: Int) {
        self.batteryLife = batteryLife
        super.init(make: make, model: model, year: year)
    }

    override func description() -> String {
        return "\(super.description()) with \(batteryLife)% battery life."
    }
}

// TASK 4: Create a subclass of Person
// - Add a property called "grade".
// - Override the "greet()" method to include the grade in the greeting.
