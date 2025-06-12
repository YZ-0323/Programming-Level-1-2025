/*
Welcome to the Data Types Lab!

In Swift, we use different data types to store information, such as:
- **String**: Text, like "Hello, world!"
- **Int**: Whole numbers, like 42
- **Double**: Decimal numbers, like 3.14
- **Bool**: True or False values

In this lab, we’ll work with each data type and learn to choose the right one for the job.
*/


// Exercise 1: Declare a String
let greeting="Hello, Swift!"


// Exercise 2: Declare an Int
var score=100


// Exercise 3: Declare a Double
let pi=3.14159


// Exercise 4: Declare a Bool
var isGameOver=false

// Swift infers types, so you don’t always need to specify them.
// Uncomment the lines below to see what type Swift assigns each value.

let myNumber = 10          // Infers Int
let myDecimal = 5.75       // Infers Double
let myMessage = "Hi!"      // Infers String

// Uncomment to see the types in action:
print(type(of: myNumber))  // Should print "Int"
print(type(of: myDecimal)) // Should print "Double"
print(type(of: myMessage)) // Should print "String"


/*
Mini Build: Basic Calculator (5 min)

In this activity, you’ll perform basic arithmetic with two numbers!

Steps:
1. Create two variables, `number1` and `number2`, and set them to any Double values.
2. Add, subtract, multiply, and divide these numbers. (Hint: use +,-,*,/)
3. Print the result of each operation.

Let’s get started!
*/

// Declare your Variables
var number1=1.1
var number2=2.2

//Addition +
print(number1+number2)

//Subtraction -
print(number1-number2)

//Multiplication *
print(number1*number2)

//Division /
print(number1/number2)
