// Part 1 - each problem worth 9 points - 90 % total

// Q1. Write a function which takes a name, say Derrick, and returns the string with the given name, in this case `"Hello, Derrick!"`. If no name(no arguement) is passed in, then the function returns the string `"Hello, World"`. The function should be named `hello`.
func hello(){
  hello(nil)
}

func hello(_ name: String?){
  if name != nil{
    print("Hello, \(name!)!")
  }else{
    print("Hello, World")
  }
}

hello()
hello("Derrick")



// Q2. Write a program that deletes all occurrences of the word "like" in the following string.
let lottaLikes = "If like, you wanna learn Swift, like, you should build lots of small apps, cuz it's like, a good way to practice."

func findLikes(_ inputString: String) -> String {
  var input = inputString
  let output = input.replacingOccurrences(of: "like,", with: "")
  return output
}

print(findLikes(lottaLikes))


// Q3. Leonard has been saving her pennies and has them all counted up. Write a program that, given a number of pennies, prints out how much money Leonard has in dollars and cents.
// `let numOfPennies = 1234` should output `"$12.34"`
let numOfPennies = 1234

func countDollars(_ i:Int) -> String{
  var input = String(i)
  input.insert("$", at:input.startIndex)
  input.insert(".",at:input.index(input.endIndex, offsetBy: -2))
  return input
}
countDollars(numOfPennies)

// Q4. Rent is increasing by 12% this year. Use a for-in loop to apply this increase to each item in the `oldVancouverRent` array.  Store the new values in the array `newVancouverRent`.
var oldVancouverRent: [Double] = [2150, 1775, 2221, 1261, 1325, 2110, 1870]
var newVancouverRent = [Double]()

func addLandlordGreed(_ input:[Double]) -> [Double]{
  var output = [Double]()
  for entry in input{
    output.append(entry*1.12)
  }
  return output
}

newVancouverRent = addLandlordGreed(oldVancouverRent)

// Q5. The Vancouver area code is changing from 778 to 236. Replace all occurrences of the area code 778 with 236 in the dictionary below.
var contacts = ["Ricky Banks":"778.548.8777",
                "Eric Siu":"778.755.9887",
                "Daniel Smith":"778.533.9899",
                "Steve Ok":"778.488.5552",
                "Silvia Kim":"415.499.7676",
                "Brian Joo":"206.123.4567",
                "Derek Kerr":"778.760.6664"]

func updateContacts(_ input: [String:String]) -> [String:String]{
  var output = [String:String]()
  for (name, areaCode) in input{
    if(String(areaCode.prefix(3)) == "778"){
      var aux = areaCode.dropFirst(3)
      aux = "236"+aux
      output[name] = String(aux)
    }else{
      output[name] = areaCode
    }
  }
  return output
}

// Q6. Below is an if-else statement matching an assignment score to a letter grade. Convert it to use `switch` statement instead.
var score = 97
var letterGrade = ""

switch score{
  case 90..<101:
    letterGrade = "A"
  case 80..<90:
    letterGrade = "B"
  case 70..<80:
    letterGrade = "C"
  case 60..<70:
    letterGrade = "D"
  default:
    letterGrade = "F"
}

// Q7. Write a function called combineLastCharacters. It should take in an array of strings, collect the last character of each string and combine those characters to make a new string to return.
var nonsenseArray = ["bungalow", "buffalo", "indigo", "although", "Ontario", "albino", "%$&#!"]

func combineLastCharacters(_ input:[String]) -> String{
  var output = ""
  for string in input{
    output += string.suffix(1)
  }
  return output
}

// Q8. Write a method, filterByDirector, that belongs to the MovieArchive class. This method should take in a dictionary of movie titles and a string representing the name of a director and return an array of movies created by that director. You can use the movie dictionary below. To test your method, instantiate an instance of the MovieArchive class and call filterByDirector from that instance.
var movies: [String:String] = [
  "Boyhood": "Richard Linklater",
  "Inception": "Christopher Nolan",
  "The Hurt Locker": "Kathryn Bigelow",
  "Selma": "Ava Du Vernay",
  "Interstellar": "Christopher Nolan",
  "My favorite filme" : "Richard Linklater"
]

class MovieArchive {
  func filterByDirector(_ currentDirector: String, movies: [String:String]) -> [String] {
    var output = [String]()
    for (movie, director) in movies{
      if director == currentDirector{
        output.append(movie)
      }
    }
    return output
  }
}

var myArchive = MovieArchive()
myArchive.filterByDirector("Richard Linklater", movies: movies)

// Q9. Use the `.filter()` method to filter the above `movies` dictionary by Director.
//     Complete the below method. It has to give the same results as above.

movies.filter { (key: String, value: String) -> Bool in 
  value=="Richard Linklater"
}



// Q10. Complete the below `CoinWallet` struct.

enum Coin: Int, CustomStringConvertible {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
  case loonie = 100
  case toonie = 200
  
  var description: String {
    return "\(self.rawValue)"
  }
}

func +(lhs: Int, rhs: Coin) -> Int {
  return lhs + rhs.rawValue
}

struct CoinWallet: CustomStringConvertible {
  var coins: [Coin]
  
  var total: Int {
    /// Complete this computed property to return the total amount of coins array
    /// Use `reduce` method.
    return 0
  }
  
  var description: String {
    /// Complete this computed property to return `$12.25` format.
    return ""
  }
  
  init(coins: [Coin]) {
    self.coins = coins
  }
  
  mutating func addCoin(_ coins: Coin...) {
    /// Complete this method to add a coin into coins array
    
  }
  
  func filterBy(coin: Coin) -> [Coin] {
    /// Complete this method to filter out the coins except for the given coin in the array
    /// Use `filter()` method
    return []
  }
  
  func count(_ coin: Coin) -> Int {
    /// Complete this method to return the number of the given coin in the array
    return 0
  }
}


var wallet = CoinWallet(coins: [.dime, .loonie, .penny, .quarter, .toonie, .toonie, .loonie, .quarter, .quarter])

print(wallet.total)                   // Expected value: 686
print(wallet.filterBy(coin: .toonie)) // Expected value: [200, 200]
print(wallet.count(.quarter))         // Expected value: 3

wallet.addCoin(.quarter, .quarter, .toonie)

print(wallet.total)                   // Expected value: 936
print(wallet.filterBy(coin: .toonie)) // Expected value: [200, 200, 200]
print(wallet.count(.quarter))         // Expected value: 5

print(wallet)                         // Expected value: $9.36


// Part 2 (10 %)
// "Make One"
//  There are 3 operations that can be used for integer X:
//   - If X is divisible by 3, divide by 3.
//   - If X is divisible by 2, divide by 2.
//   - Subtract 1.
//  Given an integer N, print the minimum number of operations used to make 1.

/*
 Input Specification:
   `N (1 <= N <= 1000000)`

 Output Specification:
   `Print the minimum number of operations performed.`
 */


// Sample Input1
// 2

// Sample Output1
// 1

// Sample Input2
// 10

// Sample Output2
// 3
// Hint: 10 -> 9 -> 3 -> 1)  (3 times)
 
func makeOne(_ x: Int) -> Int {
  var counter = 0;
  var input = x
  print(input)
  while(input != 1){
    if(input%3==0){
      input = input/3
      print("-> \(input)")
    }else if(input%2==0){
      input = input/2
      print("-> \(input)")
    }else{
      input -= 1
      print("-> \(input)")
    }
    counter += 1
  }
  return counter
}

print(makeOne(2))  // Expected value: 1
print(makeOne(10)) // Expected value: 3

//: Done!

