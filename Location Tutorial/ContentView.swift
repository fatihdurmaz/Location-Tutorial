//
//  ContentView.swift
//  Location Tutorial
//
//  Created by Fatih Durmaz on 13.11.2024.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    
    private var locationManager = CLLocationManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                                
                Button("Konum İzni İste"){
                    
                    switch locationManager.authorizationStatus {
                        
                    case .notDetermined:
                        locationManager.requestWhenInUseAuthorization()
                    case .denied, .restricted:
                        print("Konum izni reddedildi")
                    case .authorizedAlways, .authorizedWhenInUse:
                        print("Konum izni verildi")
                        
                    @unknown default:
                        print("Bilinmeyen durum")
                    }
                    
                    
                }
                .tint(.green)
                .font(.title2)
                .buttonStyle(.borderedProminent)
                
                
                Button("Konuma Eriş"){
                    guard let location = locationManager.location else {
                        print("Konum bulunamadı")
                        return
                    }
                    
                    print("Konumunuz: \(location.coordinate.latitude), \(location.coordinate.longitude)")
                    
                    
                }
                .tint(.blue)
                .font(.title2)
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Konum İzni")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
