//
//  ContentView.swift
//  LastLectureDemo
//
//  Created by Mac User on 4/30/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    // Set up dummy data, cornell base location, position, selectedPlace
    let cornellLocations = CornellLocation.dummyData
    
    static let cornell: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 42.4478, longitude: -76.4825),
            span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
        )
    )
    
    @State private var position: MapCameraPosition = cornell
    
    @State private var selectedPlace: CornellLocation?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // Map
            Map(position: $position,
                interactionModes: .all) {
                
                // Location pins
                ForEach(cornellLocations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        CornellMapPin(title: location.name)
                            .onTapGesture {
                                selectedPlace = location
                            }
                    }
                }
                
                // User location
//                UserAnnotation()
            }
            .mapStyle(.standard)
            .ignoresSafeArea()
            
            // Center button
            Button(action: {
                // Reset to Cornell campus
                position = ContentView.cornell
            }) {
                Image(systemName: "building.columns.fill")
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .padding(.bottom, 30)
            
            // Simple popup that appears directly on the map
            if let place = selectedPlace {
                VStack {
                    // Location info card
                    VStack(alignment: .leading, spacing: 10) {
                        // Close button and title in same row
                        HStack {
                            Text(place.name)
                                .font(.headline)
                                .foregroundColor(.red)
                            
                            Spacer()
                            
                            Button {
                                selectedPlace = nil
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        Text(place.description)
                            .font(.subheadline)
                            .lineLimit(3)
                        
                        // Directions button
                        Button("Get Directions") {
                            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: place.coordinate))
                            mapItem.name = place.name
                            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving])
                        }
                        .font(.callout)
                        .padding(8)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                    .padding()
                }
            }
        }
    }
}

// Preview
#Preview {
    ContentView()
}
