//
//  ImageBasics.swift
//  SwiftUIWork
//
//  Created by Shaik Areef on 10/02/25.
//

import Foundation
import SwiftUI

struct ImageBasics : View {
    var body: some View{
//        Rectangle()
//        Capsule()
        Ellipse()
//        Circle()
//            .fill(.red)
//            .foregroundColor(.green)
//            .stroke()
//            .stroke(Color.red, lineWidth: 10)
            .frame(width: 350, height: 150)
            .cornerRadius(20)
            
    }
}

#Preview {
    ImageBasics()
}
