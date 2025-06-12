
// Task 1: Arrays

// Step 1: Create an array of fruits (Atleast 3 elements)

var fruits = ["Apple", "Banana", "Orange"]

// Step 2: Print the array

print(fruits)

// Step 3: Change the second fruit

fruits[1] = "Mango"

// Step 4: Add a new fruit

fruits.append("Grapes")

fruits += ["watermelon", "pineapple"]

// Step 5: Remove the first fruit

fruits.remove(at: 0)

fruits.insert("dragonfruit", at: 0)

print(fruits)

if fruits.contains("Banana")
{
    print("Banana!")
}

print(fruits.count)
// Task 2: Dictionaries

// Step 1: Create a dictionary with names and ages

var friends = ["Alice": 25, "Bob": 30, "Charlie": 22]

// Step 2: Print the dictionary

print(friends)

friends["Moai"] = 500
// Step 3: Add a new friend

friends["David"] = 27

// Step 4: Update one friend's age

friends["Alice"] = 26

// Step 5: Remove a friend

if let removedfriend = friends.removeValue(forKey: "Bob")
{
    print("My old friend Bob was \(removedfriend) years old")
}
if let AliceAge = friends["Alice"]
{
    print("My friend Alice is \(AliceAge) years old")
}
// Task 3: Sets0

// Step 1: Create a set of numbers

var numbers: Set = [1, 2, 3, 4, 5]

// Step 2: Print the set

print(numbers)

// Step 3: Try to add a duplicate number

//numbers.insert(3)

// Step 4: Remove a number

numbers.remove(1)

print(numbers)
