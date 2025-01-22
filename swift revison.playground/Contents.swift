import UIKit

///Macros
//#Line - returns the line number
//print("This is line number: \(#line)")
//print("This is line number: \(#line)")
//#file - returns the file address
//print("File: \(#file)")

//#lineD - returns a more concise identifier for the file
//print("File ID: \(#fileID)")

//print("Column number: \(#column)")

#if os(iOS)
//print("Running on iOS")
#elseif os(macOS)
print("Running on macOS")
#else
print("Running on another platform")
#endif

struct Person {
    let name: String
    let age: Int
}
let person = Person(name: "Areef", age: 22)
//dump(person)

var add = {(n1:Int, n2:Int) -> Int in
    var n3 = n1 + n2
    return n3
}
var addition = add(10, 20)

var string = """
vdfukygfliqeu
weghvkudsbfkhcffhjask,
fja,bhdjskjewa
hjwlabkns..lkzm
"""
//print(string)

//example
/*vgkwudsjas.knc. qasjkffFNEENCJKASBCILEJNF CJKSCBAUIEKFJSC NJKAHIFNEWLI.BAJDK.BCILU.BCWIUKJ.V*/

//print("hii");print("hello")


let val = Int64.max

func sumOfEvenNumbers(in array: [Int]) -> Int {
    var sum = 0
    for i in array{
        if i % 2 == 0{
            sum += i
        }
    }
    return sum
}
let arr1 =  [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
sumOfEvenNumbers(in: arr1)

func reverseString(_ str: String) -> String {
//    return String(str.reversed())
    var rev = ""
    for i in str{
        rev = "\(i)"+rev
    }
    return rev
}
reverseString("gold")

//func fibonacciSequence(upTo n: Int) -> [Int] {
//    if n == 1 { return [1] }
//    if n == 2 { return [0, 1] }
//    
//    var sequence = [0, 1]
//    for i in 2..<n {
//        let nextNumber = sequence[i - 1] + sequence[i - 2]
//        sequence.append(nextNumber)
//    }
//    return sequence
//}
//
//func series(_ count: Int) {
//    let fullSequence = fibonacciSequence(upTo: count)
//    
//    for i in 0..<count {
//        let seq = fullSequence.prefix(i + 1)
////        print(seq, terminator: " ")
//    }
//}

// Example Usage
//series(10)

func fibonacciSequence(upTo n: Int) -> [Int] {
    if n == 1 { return [1] }
    if n == 2 { return [0, 1] }
    
    var sequence = [0, 1]
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }
    return sequence
}

func series(_ count: Int) {
    let fullSequence = fibonacciSequence(upTo: count)
//    print(fullSequence)
}

// Example Usage
series(10)

func fibo(_ n: Int) -> [Int]{
    var a = 0
    var b = 1
    var array = [a,b]
    for i in 0..<n{
        var next = a + b
        array.append(next)
        a = b
        b = next
    }
    return array
}
fibo(5)

func isPalindrome(_ str: String) -> Bool {
    let reversed = String(str.reversed())
    if reversed == str{
        return true
    }
    return false
}
isPalindrome("mom")


//var myValue = 10
//func doubleValue (_ value: Int) -> Int {
//    var value = value
//    value += value
//    return(value)
//}
//print("Before function call myValue = \(myValue)")
//print("doubleValue call returns \(doubleValue(myValue))")
//print("After function call myValue = \(myValue)")
var myValue = 10
func doubleValue (_ value: inout Int) -> Int {
    var value = value
    value += value
    return(value)
}
//print("Before function call myValue = \(myValue)")
//print("doubleValue call returns \(doubleValue(&myValue))")
//print("After function call myValue = \(myValue)")

//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    func indexIsValid(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//}
//var matrix = Matrix(rows: 2, columns: 2)
////m.indexIsValid(row: 10, column: 20)
//matrix[0,0] = 1.0
//matrix[0,1] = 2.0
//matrix[1,0] = 3.0
//matrix[1,1] = 4.0
//
//matrix.grid
//
//protocol Addable {
//    static func + (lhs: Self, rhs: Self) -> Self
//}
//extension Int: Addable {}
//extension Double: Addable {}
//extension String: Addable {}
//
//struct Add<Element:Addable>{
//    var a : Element
//    var b : Element
//    
//    mutating func addElements(a:Element, b: Element) -> Element{
//        return a + b
//    }
//}
//var added = Add(a: 10, b: 20)
//added.addElements(a: 10, b: 20)
//
//var value = 10
//print(value)
//func multiply(_ value : inout Int) -> Int{
//    value = value + 10
//    return value
//}
//print(multiply(&value))
//print(value)

//enum NetworkIssue: Error{
//    case noInternet
//    case lowBandWidth
//}
//
//func check()throws{
//    let isConnected  = false
//    let bandWidth   = 50
//    
//    if !isConnected{
//        throw NetworkIssue.noInternet
//    }else if bandWidth < 30{
//        throw NetworkIssue.lowBandWidth
//    }
//}
//
//do{
//    try check()
//}catch NetworkIssue.noInternet{
//    print("poor connection")
//}catch NetworkIssue.lowBandWidth{
//    print("network slow")
//}catch{
//    print("unknown error")
//}

enum Typo:Error{
    case spellingMistake
    case invalidFormat
}

func typoCheck()throws{
    let spellingMistake = true
    let invalidFormat = false
    
    if spellingMistake{
        throw Typo.spellingMistake
    }else if invalidFormat{
        throw Typo.invalidFormat
    }
}

do{
    try typoCheck()
}catch Typo.spellingMistake{
//    print("make sure there are no spelling mistakes")
}catch Typo.invalidFormat{
    print("invalid format")
}catch{
    print("unknown error")
}

func findPerfectSquares(start: Int, end: Int) -> [Int] {
    var perfectSquares: [Int] = []
    
    for number in start...end {
        let squareRoot = Int(sqrt(Double(number)))
        if squareRoot * squareRoot == number {
            perfectSquares.append(number)
        }
    }
    
    return perfectSquares
}

// Example usage:
let start = 1
let end = 100
let perfectSquares = findPerfectSquares(start: start, end: end)

//print("Perfect squares between \(start) and \(end): \(perfectSquares)")


let arr = [1,2,3,5,6,7]
let value = arr[arr.count - 1]
let num = value * (value + 1) / 2
var sum = 0
for i in arr{
    sum += i
}
let missingValue = num - sum
//print(missingValue)

func findMissingValue(array:[Int]) -> Int{
    let n = array.count + 1
    let expectedSum = n * (n + 1) / 2
    var actualSum = 0
    for i in array{
        actualSum+=i
    }
    return expectedSum - actualSum
}
let arr2 = [1,2,3,4,5,6,7,9]
findMissingValue(array: arr2)

func twoSum(arr1:[Int], target:Int) -> (a:Int,b:Int)?{
    for i in 0..<arr1.count{
        for j in 0..<arr1.count{
            if arr1[i] + arr1[j] == target{
                return (i,j)
            }
        }
    }
    return nil
}
twoSum(arr1: arr2, target: 7)

func rotateArray(vals:[Int],k:Int) -> [Int]?{
    let length = vals.count
    let change = k % length
    guard change > 0 else{
        return nil
    }
    let rotatingArray = vals[length - change..<length]
    let addArray = vals[0..<length - change]
    let rotatedArray = rotatingArray + addArray
    return Array(rotatedArray)
}
let nums = [1,2,3,4,5,6]
rotateArray(vals: nums, k: 1)
