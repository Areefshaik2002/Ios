import UIKit

var greeting = "Hello, playground"

class Bank{
    var bankName : String
    var bankBranch : String
    
    init(bankName: String, bankBranch: String) {
        self.bankName = bankName
        self.bankBranch = bankBranch
    }
    
    func bankDetails(bankName: String, bankBranch: String){
        print("bankName : \(bankName)")
        print("branch : \(bankBranch)")
    }
}
class SBI:Bank{
    var numberOfAccountHolders: Int
    var interestRateOnLoan : Double
    
    init(bankName: String, interestRateOnLoan:Double, bankBranch: String, numberOfAccountHolders: Int) {
        self.numberOfAccountHolders = numberOfAccountHolders
        self.interestRateOnLoan = interestRateOnLoan
        super.init(bankName: bankName, bankBranch: bankBranch)
    }
    
    func interestCalculation(amount: Int, rateOfInterest: Double){
        let finalAmount = Double(amount) * rateOfInterest
        print("the interest adds on every year is :\(finalAmount)")
    }
    
    override func bankDetails(bankName: String, bankBranch: String) {
        print("bank name: \(bankName)")
        print("banck branch: \(bankBranch)")
    }
}
class World:Bank{
    var numberOfAccountHolders: Int
    var interestRateOnLoan : Double
    var availabeInOtherCountries : Bool
    
    init(bankName: String, interestRateOnLoan:Double, abroad: Bool, bankBranch: String, numberOfAccountHolders: Int) {
        self.numberOfAccountHolders = numberOfAccountHolders
        self.interestRateOnLoan = interestRateOnLoan
        self.availabeInOtherCountries = abroad
        super.init(bankName: bankName, bankBranch: bankBranch)
    }
    
    func interestCalculation(amount: Int, rateOfInterest: Double){
        let finalAmount = Double(amount) * rateOfInterest
        print("the interest adds on every year is :\(finalAmount)")
    }
    
    override func bankDetails(bankName: String, bankBranch: String) {
        print("bank name: \(bankName)")
        print("banck branch: \(bankBranch)")
    }
}
let obj1  = Bank(bankName: "SBI", bankBranch: "Guntur")
obj1.bankDetails(bankName: "SBI", bankBranch: "Guntur")
let obj2 = SBI(bankName: "SBI", interestRateOnLoan: 8.5, bankBranch: "Vizag", numberOfAccountHolders: 6782412989728)
print(obj2.interestRateOnLoan)
print(obj2.bankDetails(bankName: "SBI", bankBranch: "Hyderabad"))
print(obj2.interestCalculation(amount: 1000000, rateOfInterest: 8.5))
let obj3 = World(bankName: "World Bank", interestRateOnLoan: 15.0, abroad: true, bankBranch: "america", numberOfAccountHolders: 456214)
print(obj3.interestCalculation(amount: 3000000000, rateOfInterest: 15.0))
obj1.bankBranch = "LB Nagar"
print(obj1.bankDetails(bankName: "union", bankBranch: "UP"))
