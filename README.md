# Location Permission and Access App (SwiftUI & CoreLocation)
*This project demonstrates how to request location permissions and access the user's current location using SwiftUI and the CoreLocation framework. It serves as a guide for developers looking to implement basic location-based functionality in iOS applications.*

**Features**

1. Request location permission from the user.
2. Check location permission status (granted, denied, etc.).
3. Access and display the user's current location (latitude and longitude).
4. Request Location Permission: Requests location permission.
5. Access Location: Retrieves the user's current location and displays it on the console.


```bash
<key>NSLocationWhenInUseUsageDescription</key>
<string>The app needs your location for its content.</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>The app always wants to access your location.</string>
```

## Usage
Click the Request Location Permission button to grant location access to the app.
```swift
// import CoreLocation

switch locationManager.authorizationStatus {
case .notDetermined:
    // Location permission has not been requested yet, requesting permission
    locationManager.requestWhenInUseAuthorization()
case .restricted, .denied:
    // Location access is restricted or denied
    print("Location access was denied or restricted.")
case .authorizedAlways, .authorizedWhenInUse:
    // Location access permission granted
    print("Location access successfully granted. The app can use location data.")
@unknown default:
    // Encountered an unknown status
    print("An unknown status was encountered.")
}

```


Click the Access Location button to fetch and display the device’s current location (latitude and longitude) in the console.
```swift
Button("Show Location"){
    guard let location = locationManager.location else {
        print("Location not found.")
        return
    }
    
    print("Your location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
}

```
