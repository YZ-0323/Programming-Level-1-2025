// Step 1: Define the Book struct
// Add properties here (title, author, publicationYear)

struct Book {
    var title: String
    var author: String
    var publicationYear: String
    
    func describe() {
        print("This book is called \(self.title), it's written by \(self.author), and it's published in \(self.publicationYear)")
    }
}

// Step 2: Create an instance of Book
// Set values for title, author, and publication year

let book = Book(title: "A book", author: "Mr.Ubial", publicationYear: "2025")
book.describe()

// Step 3: Add a function to the Book struct
// This method should describe the boo

// Step 4: Call the describe() function

// Mini Build Challenge: Define the Movie struct and movieInfo function
// Define the Movie struct
// Add properties for title, director, and release year
// Add the movieInfo() function
struct Movie {
    var title: String
    var author: String
    var publicationYear: String
    
    func movieInfo() {
        print("This movie is called \(self.title), it's directed by \(self.author), and it's a movie from \(self.publicationYear)")
    }
}

// Step 2: Create an instance of Book
// Set values for title, author, and publication year

let movie = Movie(title: "Avatar", author: "James Cameron", publicationYear: "2009")
movie.movieInfo()
