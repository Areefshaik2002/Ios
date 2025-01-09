import UIKit
//
////inheritance
//class BankAccount{
//    var accountNumber = 0
//    var accountBalance = 0.0
//    
//    
//    init(Number: Int, Balance: Double) {
//        self.accountNumber = Number
//        self.accountBalance = Balance
//    }
//    
//    func displayBalalnce(){
//        print("account number : \(accountNumber)")
//        print("account balance : \(accountBalance)")
//    }
//}
//class savingsAccount:BankAccount{
//    var interestRate:Float = 0.0
//    
//    init(Number:Int, Balance: Double ,rate: Float) {
//        self.interestRate = rate
//        super.init(Number: Number, Balance: Balance)
//    }
//    
//    func calculateInterest() -> Float
//    {
//        return interestRate * Float(accountBalance)
//    }
//    
//    override func displayBalalnce() {
////        print("account number : \(accountNumber)")
////        print("account balance : \(accountBalance)")
//        super.displayBalalnce()
//        print("prevailed interest rate : \(interestRate)")
//    }
//}
//
//let savings = savingsAccount(Number: 12312313, Balance: 500.0, rate: 0.1)
//print(savings.calculateInterest())
//savings.displayBalalnce()
//
////Extensions
//extension Int{
//    func square() -> Int{
//        return self * self
//    }
//    func cube() -> Int{
//        return self * self * self
//    }
//}
//let n = 5
//print(n.square())
//print(n.cube())



//Working with arrays and dictionaries
//Array
//var arr : [Int] = []
//if arr.isEmpty{
//    print("the array \"arr\" is empty ")
//}
//
//var nameArray = [String](repeating: "String", count: 10)
//
//let firstArray = ["Red","Green","Blue"]
//let secondArray = ["Orange","Grey"]
//let thirdArray = firstArray + secondArray
//print(thirdArray)
//print("the size of the thirdArray is \(thirdArray.count)")
//
//if thirdArray.isEmpty{
//    print("third array is an empty array")
//}else{
//    print("third array is not an empty array")
//}
//let check = thirdArray.isEmpty
//print(check)
//accessing arrays
//var nums : [Int] = [11,2,23,33,21,17,44]
//print(nums[5])
//nums[1] = 27
//nums[2] = 53
//print(nums)
//
////shuffled() - shuffels the elements of an array
//var shuffledArray:[Int] = nums.shuffled()
//print(shuffledArray)
////accessing randomn elements - randomElement()
//if let randomnElement = nums.randomElement(){
//    print(randomnElement)
//}else{
//    print("the array is empty")
//}
////append() - adds the elements at the end of an array
//nums.append(9)
//print(nums)
////inserting and removing a value in an array
//nums.insert(12, at: 1)
//print(nums)
//nums.remove(at: 5)
//print(nums)
//nums.removeLast()
//print(nums)
//Iterating in an array
//for value in nums{
//    print(value)
//}
//print(" ")
//nums.forEach{ val in
//    print(val)
//}
//print(" ")
//nums.forEach{
//    print($0)
//}

//Dictionary
//var books1 = ["001-234567":"pirates of the cariebean sea",
//             "002-987654":"In to the heart of the sea",
//             "003-329764":"uncharted-winterlands",
//             "004-582117":"Harry potter"
//            ]
//var books2:[String:String] = ["001-234567":"pirates of the cariebean sea",
//             "002-987654":"In to the heart of the sea",
//             "003-329764":"uncharted-winterlands",
//             "004-582117":"Harry potter"
//            ]
//print(books1)
//print(books2)
//var students:[Int:String] = [1:"vikky",
//                2:"vital",
//                3:"gopi",
//                4:"ankit"]

//var player  = ["lebron james","virar kohli","cristiano ronaldo"]
//var sport = ["basketball","cricket","Football"]
//var playerAndSports = Dictionary(uniqueKeysWithValues: zip(player,sport))
//print(playerAndSports)

//var player  = ["lebron james","virat kohli","cristiano ronaldo"]
//
//var result = Dictionary(uniqueKeysWithValues: zip(1..., player))
//print(result)
//print(result.count)
//print(result[2] ?? "value not found" )
//print(result[8,default: "not found"])
//result[1] = "PV sindhu"
//print(result)
//result.updateValue("garnacho", forKey: 3)
//print(result)
//result[4] = "Manjeet chillar"
//print(result)
//result.removeValue(forKey: 4)
//print(result)
//
//for (playerRank, playerName) in result{
//    print("player rank : \(playerRank) , player name : \(playerName)")
//}

//Error Handling
//let connectionOk = true
//let internetSpeed = 30.0
//let fileFound = false
//
//enum FileTransferError: Error{
//    case noConnection
//    case lowBandWidth
//    case fileNotFound
//}
//
//func FileTransfer() throws{
//    guard connectionOk else{
//        throw FileTransferError.noConnection
//    }
//    
//    guard internetSpeed > 30 else{
//        throw FileTransferError.lowBandWidth
//    }
//    guard fileFound else{
//        throw FileTransferError.fileNotFound
//    }
//}

//func sendFile() -> String{
//    do{
//        try FileTransfer()
//    }catch FileTransferError.noConnection{
//        return("No network connection")
//    }catch FileTransferError.lowBandWidth{
//        return("File transfer speed is too low")
//    }catch FileTransferError.fileNotFound{
//        return("File not found")
//    }catch{
//        return("Unknown error")
//    }
//    return("Succesfull transfer!!")
//}

//func transferFile() -> String{
//    do{
//        try FileTransfer()
//    }catch FileTransferError.noConnection, FileTransferError.lowBandWidth{
//        return("Connection issue")
//    }catch FileTransferError.fileNotFound{
//        return("file not found")
//    }catch{
//        return("Unknown error")
//    }
//    return("file sent successfully!!")
//}

//enum DivisonError: Error{
//    case dividedByZero
//}
//
//func divison(numerator: Int, denominator:Int) throws{
//    if denominator == 0{
//        throw DivisonError.dividedByZero
//    }else{
//        let result = numerator / denominator
//        print("result:", result)
//    }
//}
//
//do{
//    try divison(numerator: 10, denominator: 0)
//    print("valid divison")
//}catch DivisonError.dividedByZero{
//    print("Error : denominator cannot be zero")
//}

var OutOfMind = true
var cannotFocus = false

enum cantThinkOfAnError:Error{
    case mindExhaust
    case cantFocus
}

@MainActor func cannotThinkingReason() throws {
    guard OutOfMind else{
        throw cantThinkOfAnError.mindExhaust
//        print("You are exhausted, take care")
    }
    guard cannotFocus else{
        throw cantThinkOfAnError.cantFocus
//        print("try to concentrate, You are not focusing")
    }
}

@MainActor func reason() -> String{
    do{
        try cannotThinkingReason()
    }catch{
        throw cantThinkOfAnError.mindExhaust
        return("You are exhausted, take care")
    }catch{
        throw cantThinkOfAnError.cantFocus
        return("get help and focus")
    }catch{
        return("unknown error")
    }
    
}
