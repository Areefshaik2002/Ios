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

