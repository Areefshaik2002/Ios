import UIKit
//1.fibonacci series
//func fibonacciUpTo(n: Int) {
//    guard n > 0 else {
//        print("No Fibonacci numbers to display.")
//        return
//    }
//    var a = 0
//    var b = 1
//    print("Fibonacci series up to \(n):")
//    while b <= n {
//        print(b, terminator: " ")
//        let next = a + b
//        a = b
//        b = next
//    }
//    print()
//}
//fibonacciUpTo(n: 10)

//2.duplicate number in an array
func printDuplicates(in array: [Int]) {
    var visited: Set<Int> = []
    var duplicates: [Int] = []

    for number in array {
        if !visited.insert(number).inserted {
            duplicates.append(number)
        }
    }

    if duplicates.isEmpty {
        print("No duplicates found.")
    } else {
        print("Duplicates: \(duplicates)")
    }
}
let numbers = [1, 2, 3, 4, 5, 3, 2, 6, 7, 2]
printDuplicates(in: numbers)

//
//
////3.JSON
//func sortEventsByMonth(event:[String:String]) -> [Int]{
//    var events:[String:String] = [:]
//    var months : [Int] = []
//    for (month, value) in events.values.enumerated(){
//        months.append(month)
//    }
//    let sortedMonths = months.sorted()
//    return Array(sortedMonths)
//}
//sortEventsByMonth(event:)
//
//
//class Event{
//    private var name : String
//    private var date : String
//    private var time : String
//    private var location : String
//    
//    init(name: String, date: String, time: String, location: String) {
//        self.name = name
//        self.date = date
//        self.time = time
//        self.location = location
//    }
//    
//    func getDate()->String{
//        return date
//    }
//}
//
//class Date:Event{
//    private var month : String
//    
//    init(month: String,name: String, date: String, time: String, location: String) {
//        self.month = month
//        super.init(name: name, date: date, time: time, location: location)
//    }
//    
//    func getMonth() -> String{
//        return month
//    }
//    func setMonth(newMonth:String){
//        var newMonth = month
//    }
//}
//var monthEvent1 = Date(month: "01", name: "Areef", date: "2024-01-01", time: "09:00", location: "hyderabad")
//var monthEvent2 = Date(month: "07", name: "vikky", date: "2024-07-02", time: "10:00", location: "banglore")
//var monthEvent3 = Date(month: "02", name: "amal", date: "2024-02-03", time: "01:00", location: "chennai")
//var monthEvent4 = Date(month: "11", name: "anand", date: "2024-11-04", time: "08:00", location: "kolkata")
//var monthEvent5 = Date(month: "08", name: "jai", date: "2024-08-05", time: "11:00", location: "gujarat")
//var monthEvent6 = Date(month: "12", name: "govind", date: "2024-12-05", time: "11:00", location: "hyderabad")
//var monthEvent7 = Date(month: "03", name: "ajay", date: "2024-03-05", time: "11:00", location: "kolkata")
//var monthEvent8 = Date(month: "04", name: "amar", date: "2024-04-05", time: "11:00", location: "hyderabad")
//var monthEvent9 = Date(month: "05", name: "karan", date: "2024-05-05", time: "11:00", location: "kolkata")
//var monthEvent10 = Date(month: "09", name: "vinay", date: "2024-09-05", time: "11:00", location: "hyderabad")
//var monthEvent11 = Date(month: "10", name: "vishal", date: "2024-10-05", time: "11:00", location: "kolkata")
//var monthEvent12 = Date(month: "06", name: "manoj", date: "2024-06-05", time: "11:00", location: "hyderabad")
//
//
//var monthArray:[String] = []
//let m1 = monthEvent1.getMonth()
//let m2 = monthEvent2.getMonth()
//let m3 = monthEvent3.getMonth()
//let m4 = monthEvent4.getMonth()
//let m5 = monthEvent5.getMonth()
//let m6 = monthEvent6.getMonth()
//let m7 = monthEvent7.getMonth()
//let m8 = monthEvent8.getMonth()
//let m9 = monthEvent9.getMonth()
//let m10 = monthEvent10.getMonth()
//let m11 = monthEvent11.getMonth()
//let m12 = monthEvent12.getMonth()
//
//monthArray.append(m1)
//monthArray.append(m2)
//monthArray.append(m3)
//monthArray.append(m4)
//monthArray.append(m5)
//monthArray.append(m6)
//monthArray.append(m7)
//monthArray.append(m8)
//monthArray.append(m9)
//monthArray.append(m10)
//monthArray.append(m11)
//monthArray.append(m12)
//
//let sortedMonths = monthArray.sorted()
//
//print(sortedMonths)
