//
//  searching.swift
//  Maps
//
//  Created by Shaik Areef on 17/03/25.
//

//Ios 17 and above

import SwiftUI
import MapKit

struct SearchableMapView: View {
    @State private var searchText: String = ""
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        VStack {
            TextField("Search for a place", text: $searchText, onCommit: {
                searchLocation()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            Map(position: $position) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func searchLocation() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchText) { placemarks, error in
            if let placemark = placemarks?.first, let location = placemark.location {
                position = .region(
                    MKCoordinateRegion(
                        center: location.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                )
            }
        }
    }
}

#Preview{
    SearchableMapView()
}


