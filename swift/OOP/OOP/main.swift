import Foundation

protocol Rental{//abstraction
    var carMaker: String{get set}
    var carModel: String{get set}
    var rentalPricePerDay: Double{get set}
    var isCarAvailable: Bool{get set}
    
    func rentCar(forDays days:Int) -> Double
    func returnCar()
}

class Car:Rental{
     var carMaker: String
     var carModel: String
     var rentalPricePerDay: Double
     var isCarAvailable: Bool = false
    
    init( carMaker: String, carModel: String, rentalPricePerDay: Double, isCarAvailable: Bool) {
        self.carMaker = carMaker
        self.carModel = carModel
        self.rentalPricePerDay = rentalPricePerDay
        self.isCarAvailable = isCarAvailable
    }
        
    func rentCar(forDays days: Int) -> Double {
        if isCarAvailable == false{
            print("car is already rented, sorry for inconvienece")
            return 0.0
        }else{
            isCarAvailable = true
            let totalCost = rentalPricePerDay * Double(days)
            return totalCost
        }
    }
    
    func returnCar() {
        if isCarAvailable == false{
            isCarAvailable = true
            print("returned \(carMaker) \(carModel).thank you, great doing business with you.")
        }else{
            print("there might be a confusion our \(carMaker) \(carModel) is not rented")
        }
    }
}
class ElectricCar:Car{//inheritance
    var batteryCapacity:Int
    
    init(batteryCapacity: Int, rentalPerDay: Double, carMaker: String, carModel: String, rentalPricePerDay: Double, isCarAvailable: Bool) {
        self.batteryCapacity = batteryCapacity
        super.init(carMaker: carMaker, carModel: carModel, rentalPricePerDay: rentalPricePerDay, isCarAvailable: isCarAvailable)
    }
    
    override func rentCar(forDays days: Int) -> Double { //polymorphism
        let totalPrice = super.rentCar(forDays: days)
        if totalPrice > 0{
            print("cheers to you eco-friendly and calm ride")
        }
        return totalPrice
    }
    
    override func returnCar() {
        if isCarAvailable == false{
            isCarAvailable = true
            print("thank you for using \(carMaker) \(carModel)")
        }else{
            print("this \(carMaker) \(carModel) car is not rented")
        }
    }
}

class CarRental{
    var availableCars : [Rental]
    
    init(){
        self.availableCars = []
    }
    
    func addCar(_ car: Rental){
        availableCars.append(car)
    }
    
    func rentCar(_ car: Rental, fordays days:Int) -> Double{
        return car.rentCar(forDays: days)
    }
    
    func returnCar(_ car: Rental){
        car.returnCar()
    }
    
    func listAvailableCars() {
        print("\nAvailable cars:")
        for (index, car) in availableCars.enumerated() where car.isCarAvailable {
            print("\(index + 1). \(car.carMaker) \(car.carModel) - \(car.rentalPricePerDay) USD/Day")
        }
    }
}
func startCarRentalApp(){
    let rentalSystem = CarRental()
    
    let thar = Car(carMaker: "Mahendra", carModel: "Thar", rentalPricePerDay: 200.0, isCarAvailable: true)
    let innova = Car(carMaker: "Toyota", carModel: "Innova", rentalPricePerDay: 180.0, isCarAvailable: true)
    let city = Car(carMaker: "Honda", carModel: "City", rentalPricePerDay: 140.0, isCarAvailable: true)
    let nano = Car(carMaker: "Tata", carModel: "Nano", rentalPricePerDay: 80.0, isCarAvailable: true)
    let swift = Car(carMaker: "Maruti", carModel: "Swift", rentalPricePerDay: 110.0, isCarAvailable: true)
    
    rentalSystem.addCar(thar)
    rentalSystem.addCar(innova)
    rentalSystem.addCar(city)
    rentalSystem.addCar(nano)
    rentalSystem.addCar(swift)
    

    
    print("""
1.Rent a car
2.Return  car
3.Exit/Quit
""")
    if let input = readLine(), let option = Int(input){
        switch option{
        case 1:
            rentalSystem.listAvailableCars()
            print("\nEnter the number of the car you want to rent (1-\(rentalSystem.availableCars.count)) or type 'exit' to quit:")
            if let carChoice = readLine(), carChoice.lowercased() != "exit" {
                if let carIndex = Int(carChoice), carIndex > 0 && carIndex <= rentalSystem.availableCars.count {
                    let selectedCar = rentalSystem.availableCars[carIndex - 1]
                    print("How many days would you like to rent the car for?")
                    if let days = readLine(), let rentalDays = Int(days) {
                       let totalCost = rentalSystem.rentCar(selectedCar, fordays: rentalDays)
                            print("Total cost: \(totalCost) USD")
                    } else {
                        print("Invalid number of days.")
                    }
                }
            }
        case 2:
            print("Enter the carModel that you want to return")
            if let carReturn = readLine(){
                let returnChoice = carReturn.trimmingCharacters(in: .whitespacesAndNewlines)
                if let carToReturn = rentalSystem.availableCars.first(where: {
                    $0.carModel == returnChoice && !$0.isCarAvailable
                }) {
                    rentalSystem.returnCar(carToReturn)
                    print("\(carToReturn.carMaker) \(returnChoice) has been returned successfully.")
                }else {
                    print("No rented car found matching the model '\(returnChoice)'.")
                }
            } else {
                print("Failed to read input. Please try again.")
            }
        case 3:
            print("Exiting rental system")
            break
        default:
            print("invalid option selection")
            }
            
            
        }
        
    }
    
startCarRentalApp()
