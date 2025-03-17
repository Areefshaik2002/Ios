//
//  Event.swift
//  practiceApp
//
//  Created by Shaik Areef on 11/03/25.
//

import Foundation

struct Event: Codable, Identifiable{
    var id = UUID()
    var title: String
    var date: Date
    var description: String
}
