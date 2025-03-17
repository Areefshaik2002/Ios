//
//  Model.swift
//  To-Do List
//
//  Created by Shaik Areef on 11/03/25.
//

import Foundation

struct ToDo: Codable, Identifiable {
    var id: UUID = UUID()
    var title: String
    var endDate: Date
    var endTime: Date
    var description: String
    var isCompleted: Bool = false
}
