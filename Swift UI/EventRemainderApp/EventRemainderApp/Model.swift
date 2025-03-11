//
//  Model.swift
//  EventRemainderApp
//
//  Created by Shaik Areef on 10/03/25.
//

import Foundation

struct EventModel: Codable, Identifiable{
    var id = UUID()
    var title: String
    var date: Date
    var description: String
}
