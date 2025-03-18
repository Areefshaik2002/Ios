//
//  MultipleNavigations.swift
//  NavigationStacks
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI

enum Screen: Hashable {
    case detail
    case phoneNumber
    case address
}

struct MultipleNavigations: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            navigations
                .navigationTitle("Home")
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .detail:
                        detailsNavigation
                    case .phoneNumber:
                        phoneNumberNavigation
                    case .address:
                        addressNavigation
                    }
                }
        }
    }
    
    var navigations: some View {
        VStack(spacing: 16) {
            Button("Go to Details") {
                path.append(Screen.detail)
            }
            Button("Go to phone number") {
                path.append(Screen.phoneNumber)
            }
            Button("Go to address") {
                path.append(Screen.address)
            }
        }
    }
    
    var detailsNavigation: some View {
        Text("User Details")
            .frame(width: 200, height: 50, alignment: .center)
            .background(.blue)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
    }
    var phoneNumberNavigation: some View {
        Text("phone number Details")
            .frame(width: 200, height: 50, alignment: .center)
            .background(.blue)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
    }
    var addressNavigation: some View {
        Text("address Details")
            .frame(width: 200, height: 50, alignment: .center)
            .background(.blue)
            .cornerRadius(12)
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
    }
}

#Preview {
    MultipleNavigations()
}
