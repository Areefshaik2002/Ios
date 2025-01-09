//import UIKit
//
////Function to reverse a string
//func reverseString(_ str:String) -> String{
//    return String(str.reversed())
//}
//let original = "Swift"
//let reversed = reverseString(original)
//print(reversed)
////Check if a number is prime
//
//func isPrime(_ num:Int) ->Bool{
//    if num < 2 {return false}
//    for i in 2..<num{
//        if num % i == 0{
//            return false
//        }
//    }
//    return true
//}
//
//print(isPrime(11))
////Factorial of a number
//func Fact(_ val:Int) ->Int{
//    var fact = 1
//    for j in 1...val{
//        fact = fact * j
//    }
//    return fact
//}
//print(Fact(4))
////Palindrome or not
//func isPalindrome(_ word:String) -> Bool{
//    let reversed = String(word.reversed())
//    return word == reversed
//
//}
//if isPalindrome("areef"){
//    print("the string is a palindrome")
//}else{
//    print("the string is not a palindrome")
//}
////Largest number in an array
//var arr =  [17,26,35,14,23,42,81]
//func maximumVal(_ array:[Int]) -> Int?{
//    return array.max()
//}
//let largest = maximumVal(arr)
//print(largest ?? "no largest or numbers")
//
////sum of numbers in an array
//var array =  [17,26,35,14,23,42,81]
//func sumOfVal(_ array:[Int]) -> Int?{
//    return array.reduce(0, +)
//}
//let sum = sumOfVal(arr)
//print(sum ?? "no numbers")
//
////Clousre Example
//let multiply = {(_ val1:Int, _ val2:Int) -> Int in
//    return val1 * val2
//}
//let result = multiply(10, 20)
//print(result)

////Fibonacci series
//func Finbonacci(_ n: Int) -> [Int] {
//    guard n > 1 else {return [0]}
//    var sequence = [0, 1]
//    while sequence.count < n {
//        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
//        sequence.append(next)
//    }
//    return sequence
//}
//
//let fib = Finbonacci(7)
//print(fib)

 //OOP - Object oriented programming
//class
class BankAccount{
    var accountBalance:Float = 0
    var accountNumber:Int = 0
    var fee:Float = 0
    
    init(number:Int, balance:Float, fees:Float){
        self.accountNumber = number
        self.accountBalance = balance
        self.fee = fees
    }
    
    var balanceAfterFee : Float{
        get{
            return accountBalance - fee
        }
        set(newBalance){
            accountBalance = newBalance - fee
        }
    }
    
    func getDetails(){
        print("account number : \(accountNumber)")
        print("account balance : \(accountBalance)")
    }
    
    class func getMaxBalance()->Float{
        return 100000.00
    }
}

var account1 = BankAccount(number: 1231321, balance: 400.00, fees: 100)
    print(account1.getDetails())//Instance method
    print(account1.accountBalance)
    print(account1.accountNumber)
    print(account1.balanceAfterFee)
    account1.balanceAfterFee = 800.0
    print(account1.accountBalance)


////self
//class MyClass {
//    var myNumber = 10 // class property
//    
//    init(myNumber: Int) {
//        self.myNumber = myNumber
//    }
//    
//    func addTen(myNumber: Int) {
//        print(myNumber) // Output the function parameter value
//        print(self.myNumber) // Output the class property value
//    }
//}
//var my = MyClass(myNumber: 10)
//print(my.addTen(myNumber: 30))

