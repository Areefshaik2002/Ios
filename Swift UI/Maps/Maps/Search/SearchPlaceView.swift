//
//  SearchPlaceView.swift
//  Maps
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI
import MapKit

struct SearchableView: View {
    @State private var searchText: String = ""
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 17.385044, longitude: 78.486671),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    var body: some View {
        VStack {
            TextField("Search for a place...", text: $searchText, onCommit: {
                searchLocation()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Map(coordinateRegion: $region)
                .edgesIgnoringSafeArea(.all)
        }
    }
    
    func searchLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchText) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                region = MKCoordinateRegion(
                    center: location.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                )
            }
        }
    }
}

#Preview{
    SearchableView()
}
