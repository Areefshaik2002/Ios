//
//  Practice.swift
//  Maps
//
//  Created by Shaik Areef on 17/03/25.
//

import SwiftUI
import MapKit

struct Practice: View {
    @State private var searchText: String = ""
    @State private var position: MapCameraPosition = .automatic
    @State private var searchResults: [MKMapItem] = []

    var body: some View {
        VStack {
            TextField("Search for a place", text: $searchText, onCommit: {
                Task { await performSearch() }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            Map(position: $position) {
                UserAnnotation()
                
                ForEach(searchResults, id: \.self) { place in
                    Marker(place.name ?? "Unknown", coordinate: place.placemark.coordinate)
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

    func performSearch() async {
        let results = await searchPlaces()
        DispatchQueue.main.async {
            self.searchResults = results
            if let firstResult = results.first {
                self.position = .region(
                    MKCoordinateRegion(
                        center: firstResult.placemark.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
                )
            }
        }
    }

    func searchPlaces() async -> [MKMapItem] {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.resultTypes = .pointOfInterest

        let search = MKLocalSearch(request: request)

        do {
            let response = try await search.start()
            return response.mapItems
        } catch {
            print("Error searching for places: \(error.localizedDescription)")
            return []
        }
    }
}

#Preview{
    Practice()
}


