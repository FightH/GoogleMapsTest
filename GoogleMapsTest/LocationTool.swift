//
//  LocationTool.swift
//  GoogleMapsTest
//
//  Created by Developer H on 2020/11/9.
//

import UIKit
import CoreLocation

class LocationTool: NSObject {
    var locationManager: CLLocationManager!
    var _interval: TimeInterval = 30
    var lastUpdateTime: TimeInterval?
    
    static var share: LocationTool {
        let instance = LocationTool()
        instance.locationManager = CLLocationManager()
        instance.locationManager.delegate = instance
        instance.locationManager.allowsBackgroundLocationUpdates = true
        instance.locationManager.pausesLocationUpdatesAutomatically = false
        instance.locationManager.distanceFilter = kCLDistanceFilterNone
        instance.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        return instance
    }
    
    func startLocation() {
        self.locationManager .requestAlwaysAuthorization()
        self.locationManager .startUpdatingLocation()
    }
    
}

extension LocationTool: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        print("latitude:\(location?.coordinate.latitude ?? 0.0)  longitude:\(location?.coordinate.longitude ?? 0.0)")
        
    }
    
    
}
