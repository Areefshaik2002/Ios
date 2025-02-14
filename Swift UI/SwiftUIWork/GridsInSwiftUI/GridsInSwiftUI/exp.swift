//
//  exp.swift
//  GridsInSwiftUI
//
//  Created by Shaik Areef on 14/02/25.
//

import SwiftUI

struct exp: View {
    var body: some View {
        NavigationStack{
            VStack{
                ForEach(0..<10){ value in
                    NavigationLink(value: value){
                        Text("click link \(value)")
                    }
                }
            }
            .navigationTitle("Navigation stack demo")
            .navigationDestination(for: Int.self){ vals in
                ContentView(digits: vals)
            }
        }
    }
}
