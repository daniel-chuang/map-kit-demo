//
//  CornellLocation.swift
//  LastLectureDemo
//
//  Created by Mac User on 4/30/25.
//

import Foundation
import MapKit

// step 1:
struct CornellLocation: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let coordinate: CLLocationCoordinate2D
    
    // modifying a hasher
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // comparator
    static func == (lhs: CornellLocation, rhs: CornellLocation) -> Bool {
        lhs.id == rhs.id
    }
    
    static let dummyData: [CornellLocation] = [
        CornellLocation(
            name: "McGraw Tower",
            description: "Home to Cornell's iconic bells. The Cornell Chimes are played three times daily by student chimesmasters and can be heard across campus.",
            coordinate: CLLocationCoordinate2D(latitude: 42.4473, longitude: -76.4855)
        ),
        CornellLocation(
            name: "Willard Straight Hall",
            description: "A student union building that houses dining options, student organization offices, and event spaces. Built in 1925 and named after Cornell graduate Willard Straight.",
            coordinate: CLLocationCoordinate2D(latitude: 42.4467, longitude: -76.4856)
        ),
        CornellLocation(
            name: "Uris Library",
            description: "Cornell's oldest library featuring the iconic A.D. White Reading Room. Often called the 'Harry Potter library' for its grand architecture.",
            coordinate: CLLocationCoordinate2D(latitude: 42.4479, longitude: -76.4845)
        ),
        CornellLocation(
            name: "Duffield Hall",
            description: "Home to Cornell's nanotechnology research facilities and engineering classrooms. Features a large atrium that serves as a student gathering space.",
            coordinate: CLLocationCoordinate2D(latitude: 42.4448, longitude: -76.4835)
        ),
        CornellLocation(
            name: "Cornell Dairy Bar",
            description: "Famous for its ice cream made right on campus. Cornell's Food Science program produces over 30 flavors using milk from Cornell's own dairy cows.",
            coordinate: CLLocationCoordinate2D(latitude: 42.4499, longitude: -76.4775)
        )
    ]
}
