//
//  ExpenseModel.swift
//  ExpensesManagerAppUsingSwiftData
//
//  Created by Shaik Areef on 13/03/25.
//

import Foundation
import SwiftData

@Model
class ExpenseModel{
    @Attribute(.unique) var name: String
    var date: Date
    var price: Double
    
    init(name: String, date: Date, price: Double) {
        self.name = name
        self.date = date
        self.price = price
    }
}
