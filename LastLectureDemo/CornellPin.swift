//
//  CornellPin.swift
//  LastLectureDemo
//
//  Created by Mac User on 4/30/25.
//

import SwiftUI
import MapKit

struct CornellMapPin: View {
    
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.caption)
                .padding(5)
                .background(Color.white)
                .foregroundColor(Color.red)
                .cornerRadius(10)
                .shadow(radius: 2)
                
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                
                Text("C")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y: -5)
        }
    }
}

#Preview {
    CornellMapPin(title: "Test")
}
