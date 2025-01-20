import UIKit

///reverse a array
//using built in funcs
func reverseArray(arr1:[Int]) -> [Int]{
    return Array(arr1.reversed())
}
let arr1 = [1,2,3,4,5,6,7]
reverseArray(arr1: arr1)
//without built in funcs
func reversedArray(arr2:[Int]) -> [Int]{
    var reversed:[Int] = []
    for i in arr2{
        reversed.insert(i, at: 0)
    }
    return reversed
}
let sol = reversedArray(arr2: arr1)
//print(sol)

//reverse a string
//using inbuikt funcs
func revString(str1:String) -> String{
    return String(str1.reversed())
}
revString(str1: "Areef")
//without inbuilts
func reverseString(str2:String) -> String{
    var rev = ""
    for i in str2{
        rev = "\(i)"+rev
    }
    return rev
}
reverseString(str2: "IOS")

//palindrome or not?
func isPalindrome(str3:String) -> Bool{
    let reversedString = String(str3.reversed())
    return str3 == reversedString
}
isPalindrome(str3: "madam")

//number of occurences of a character in string
func noOFoccurences(str4:String,char:Character) -> Int{
    return str4.filter{$0 == char}.count
}
noOFoccurences(str4: "damage", char: "a")

//number of vowels and consonants in a string
func numberOfVC(string:String) -> (vowels:Int, consonants:Int){
    let vowelSet = "aeiouAEIOU"
    let vowels = string.filter{vowelSet.contains($0)}.count
    let consonants = string.filter{$0.isLetter && !vowelSet.contains($0)}.count
    return (vowels, consonants)
}
numberOfVC(string: "HelloWorld")

//matching elements in an array
func matchingElements(array:[Int], match:Int) -> [Int]{
    return array.filter{$0 == match}
}
let exampleArray = [1,2,3,4,5,1,2,3,4,5,1,3,4,5,5]
matchingElements(array: exampleArray, match: 5)

//Bubble sort
func bubbleSort(bubble: inout [Int]){
    for i in 0..<bubble.count{
        for j in 0..<bubble.count - i - 1{
            if bubble[j] > bubble[j+1]{
                bubble.swapAt(j, j+1)
            }
        }
    }
}
var arr = [23,11,22,44,55,1]
bubbleSort(bubble: &arr)

//insertion sort
func insertionSort(values: inout [Int]){
    for i in 1..<values.count{
        let key = values[i]
        var j = i - 1
        while j>=0 && values[j] > key{
            values[j+1] = values[j]
            j-=1
        }
        values[j+1] = key
    }
}
var insertionArray = [5,4,3,2,1]
insertionSort(values: &insertionArray)

//swap 2 values without using 3rd variable
func swap(a:Int, b:Int) -> (a:Int,b:Int){
    var a = a
    var b = b
    a = a + b
    b = a - b
    a = a - b
    return (a,b)
}
swap(a: 10, b: 20)

//finonacci series using recursion
//func fibonacci(_ n:Int) -> Int{
//    if n<=1{return n}
//    return fibonacci(n-1) + fibonacci(n-2)
//}
//func series(count: Int) {
//    for i in 0...count{
//        print(fibonacci(i), terminator: " ")
//    }
//    print()
//}
//series(count: 10)

func fibonacciseries(_ n:Int){
    var a = 0, b = 1
    for _ in 0..<n{
        print(a, terminator: " ")
        let next  = a + b
        a = b
        b = next
    }
    print()
}
print(fibonacciseries(10))

//factorial 0f a number
func factorial(n:Int) -> Int {
    var fact = 1
    for i in 1...n{
        fact = fact * i
    }
    return fact
}
factorial(n: 6)

//second largest element in an array
func secondLargestElement(elementArray:[Int]) -> Int{
    let sortedArray = elementArray.sorted()
    return sortedArray[sortedArray.count - 2]
}
let exampleArrays = [2,1,3,5,7,6,4]
secondLargestElement(elementArray: exampleArrays)

//removing a input character from string
func removeChar(strs:String, chars:Character) ->String{
    return strs.filter{$0 != chars}
}
removeChar(strs: "Godzilla", chars: "l")

//prime or not
func isPrime(_ n:Int) -> Bool{
    if n<2{return false}
    for i in 2..<n{
        if n % i == 0{
            return false
        }
    }
    return true
}
isPrime(11)

//sum of the numbers in an array
func sumOfNumbers(_ numArray:[Int]) -> Int{
    var sum = 0
    for i in 0..<numArray.count{
        sum += numArray[i]
    }
    return sum
}
let sumArray = [1,2,3,4,5,6,7,8,9,10]
sumOfNumbers(sumArray)


//Enumerations
enum CompassPoint:CaseIterable{
    case north
    case south
    case east
    case west
}
var direction = CompassPoint.east
direction = .north

switch direction{
case .east:
    print("east")
case .north:
    print("north")
case .south:
    print("south")
case .west:
    print("west")
}

for look in CompassPoint.allCases{
//    print(look)
}

enum Scanner{
    case upc(Int,Int, Int, Int)
    case qr(String)
}
var productBarcode = Scanner.upc(1, 1234, 5678, 90)
//productBarcode = .qr("Muchkins")

switch productBarcode{
case .upc(let pid, let mid, let tid, let priceiId):
    print("productId = \(pid), manufacturerId = \(mid), transportId = \(tid), price =  \(priceiId)")
case .qr(let str):
    print("qrcode = \(str)")
}

enum Planets:Int{
    case mercury = 10, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let planet = Planets(rawValue: 15)

enum ArithmeticExpressions{
    case number(Int)
    indirect case addition(ArithmeticExpressions,ArithmeticExpressions)
    indirect case multiplication(ArithmeticExpressions, ArithmeticExpressions)
}
let five = ArithmeticExpressions.number(5)
let three = ArithmeticExpressions.number(3)
let sum = ArithmeticExpressions.addition(five, three)
let product = ArithmeticExpressions.multiplication(sum, five)

func calculate(_ expression: ArithmeticExpressions) -> Int{
    switch expression{
    case let .number(value):
        return value
    case let .addition(left, right):
        return calculate(left) + calculate(right)
    case let .multiplication(left, right):
        return calculate(left) * calculate(right)
    }
}
//print(calculate(product))

//optional chaining
//class Person{
//    var residence:Residence?
//}
//class Residence{
//    var numberOfRooms = 1
//}
//
//let jhon = Person()
//if let roomCount = jhon.residence?.numberOfRooms{
//    print("jhon's residence has \(roomCount) rooms")
//}else{
////    print("unable to retrive number of rooms")
//}
//jhon.residence = Residence()

class Guy{
    var name:String
    var Adress : Adress?
    
    init(name: String) {
        self.name = name
    }
}
class Adress{
    var city:String
    var street:String
    
    init(city: String, street: String) {
        self.city = city
        self.street = street
    }
}
let person = Guy(name: "Areef")
person.Adress = Adress(city: "Hyderabad", street: "Madhapur")

if let cityName = person.Adress?.city{
    print("i live in \(cityName)")
}else{
    print("insuffient data")
}

person.Adress = nil
print(person.Adress?.city ?? "No address")

class Him{
    var residence:Residence?
}
class Residence{
    var rooms:[Room] = []
    var numberOfRooms:Int {
        return rooms.count
    }
    subscript(i:Int)->Room{
        get{
            return rooms[i]
        }
        set{
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms(){
        print("number of rooms are \(numberOfRooms)")
    }
    var address : Address?
}

class Room{
    let name:String
    init(name: String) {
        self.name = name
    }
}

class Address{
    var buildingNumber : String?
    var buildingName :String?
    var street: String?
    func buildingIdentifier() -> String?{
        if let street = street,let buildingNumber = buildingNumber{
            return ("street = \(street), buidlingNumber = \(buildingNumber)")
        }else if buildingName != nil{
            return ("buildingnName = \(String(describing: buildingName))")
        }else{
            return nil
        }
    }
}

let rose = Him()
if let roomCount = rose.residence?.numberOfRooms{
    print("number of rooms are \(roomCount)")
}else{
    print("unable to the number of rooms")
}

let someAddress = Address()
someAddress.buildingName = "Rent a desk"
someAddress.buildingNumber = "29"
someAddress.street = "Huda techno enclave"
rose.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")


    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"


    return someAddress
}
rose.residence?.address = createAddress()


//concurrency
func fetchData() async throws -> String {
    try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds in nanoseconds
    return "Data fetched"
}

func printData() async throws {
    let data = try await fetchData()
    print(data)
}

Task {
    do {
        try await printData()
    } catch {
        print("Error: \(error)")
    }
}

func getData() async throws -> String{
    try await Task.sleep(nanoseconds: 4_000_000_000)
    return "got the data"
}
func printWhatYouGot() async throws{
    let now = try await getData()
    print(now)
}
Task{
    do{
        try await printWhatYouGot()
    }catch{
        print("error: \(error)")
    }
}

//macros - used to generate code at compile time
func myFunction() {
    print("Currently running \(#function)")
    #warning("Something's wrong")
}

