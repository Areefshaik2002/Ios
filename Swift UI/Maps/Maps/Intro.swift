//
//  Intro.swift
//  Maps
//
//  Created by Shaik Areef on 18/03/25.
//
import MapKit
import SwiftUI

struct MapsIntro : View{
    
    let cameraPosition : MapCameraPosition  = .region(.init(center: .init(latitude: 16.306652, longitude: 80.436539), latitudinalMeters: 600, longitudinalMeters: 600))
    
    let locationManager = CLLocationManager()
    @State private var lookAroundScene: MKLookAroundScene?
    @State private var isShowingLookAround : Bool = false
    @State private var route: MKRoute?
    
    var body: some View{
        Map(initialPosition: cameraPosition){
            Annotation("Dmart", coordinate: .Dmart, anchor: .center){
                Image("DMart-Guntur-Andhra-Pradesh")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars"){
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .Dmart)
                                guard lookAroundScene != nil else{return}
                                isShowingLookAround = true
                            }
                        }
                        Button("Get Directions", systemImage: "arrow.turn.down.right"){
                            getDirections(to: .Dmart)
                        }
                    }
            }
            Annotation("South India Shoping Mall", coordinate: .southIndiaShoppingMall, anchor: .center){
                Image("sism")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars"){
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .southIndiaShoppingMall)
                                guard lookAroundScene != nil else{return}
                                isShowingLookAround = true
                            }
                            
                        }
                        Button("Get Directions", systemImage: "arrow.turn.down.right"){
                            getDirections(to: .southIndiaShoppingMall)
                        }
                    }
            }
            Annotation("the chennai Shoping Mall", coordinate: .chennaiShoppingMall, anchor: .center){
                Image("tcsm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .contextMenu{
                        Button("Open Look Around", systemImage: "binoculars"){
                            Task{
                                lookAroundScene = await getLookAroundScene(from: .chennaiShoppingMall)
                                guard lookAroundScene != nil else{return}
                                isShowingLookAround = true
                            }
                        }
                        Button("Get Directions", systemImage: "arrow.turn.down.right"){
                            getDirections(to: .chennaiShoppingMall)
                        }
                    }
            }
            UserAnnotation()
            if let route{
                MapPolyline(route)
                    .stroke(Color.green, lineWidth: 4)
            }
        }
        .onAppear{
            locationManager.requestWhenInUseAuthorization()
        }
        .tint(.purple)
        .mapControls{
            MapUserLocationButton()
            MapCompass()
            MapPitchToggle()
            MapScaleView()
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .lookAroundViewer(isPresented: $isShowingLookAround , initialScene: lookAroundScene)
    }
    
    func getLookAroundScene(from coordinate: CLLocationCoordinate2D) async -> MKLookAroundScene? {
        do{
            return try await MKLookAroundSceneRequest(coordinate: coordinate).scene
        }catch{
            print("error occured, \(error). cannot get look around scene")
            return nil
        }
    }
    
    func getUserLocation() async -> CLLocationCoordinate2D? {
        let updates = CLLocationUpdate.liveUpdates()
        do{
            let update = try await updates.first(where: {$0.location?.coordinate != nil})
            return update?.location?.coordinate
        }catch{
            print("cannot get user locartion : \(error.localizedDescription)")
            return nil
        }
    }
    
    func getDirections(to destination: CLLocationCoordinate2D) {
        Task{
            guard let userLocation = await getUserLocation() else { return }
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: MKPlacemark(coordinate: userLocation))
            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
            request.transportType = .walking
            do{
                let directions = try await MKDirections(request: request).calculate()
                route = directions.routes.first
            }catch{
                print("error occured: \(error.localizedDescription)")
            }
        }
    }
}

//            Marker("Dmart Guntur", systemImage: "smallcircle.filled.circle.fill", coordinate: .Dmart)
//            Marker("South India Shopping Mall, Guntur", systemImage: "smallcircle.filled.circle.fill", coordinate: .southIndiaShoppingMall)
//            Marker("Chennai shopping Mall Guntur", systemImage: "smallcircle.filled.circle.fill", coordinate: .chennaiShoppingMall)

#Preview {
    MapsIntro()
}

extension CLLocationCoordinate2D{
    static let appleVisitorCenter = CLLocationCoordinate2D(latitude: 37.332753, longitude: -122.005372)
    static let southIndiaShoppingMall = CLLocationCoordinate2D(latitude: 16.305540335936204, longitude: 80.43693318243433)
    static let chennaiShoppingMall = CLLocationCoordinate2D(latitude: 16.3074282190506, longitude: 80.43687405966183)
    static let Dmart = CLLocationCoordinate2D(latitude: 16.297553616791152, longitude: 80.44753657876666)
}


