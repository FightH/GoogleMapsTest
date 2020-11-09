//
//  MapViewController.swift
//  GoogleMapsTest
//
//  Created by Developer H on 2020/11/9.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    var latitude: CLLocationDegrees = -33.868
    var longitude: CLLocationDegrees = 151.2086
    var radius: CLLocationDistance = 500
    
    lazy var mapView: GMSMapView = {
        let camera = GMSCameraPosition(latitude: self.latitude, longitude: self.longitude, zoom: 1)
      return GMSMapView(frame: .zero, camera: camera)
    }()

    var observation: NSKeyValueObservation?
    
    var location: CLLocation? {
      didSet {
        guard oldValue == nil, let firstLocation = location else { return }
        mapView.camera = GMSCameraPosition(target: firstLocation.coordinate, zoom: 14)
      }
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
        mapView.delegate = self
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        view = mapView
        observation = mapView.observe(\.myLocation, options: [.new]) {
        [weak self] mapView, _ in
            self?.location = mapView.myLocation
        }
        
//        let latitude = 31.86387
//        let longitude = 117.141436
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        marker.title = "Company"
        marker.map = mapView
        
        let circleCenter = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        let circle = GMSCircle(position: circleCenter, radius: self.radius)
        circle.fillColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3)
        circle.strokeColor = .clear
        circle.map = mapView
        
//        let latitudeMargin = 0.005
//        let longitudeMargin = 0.008
//        
//        let rect = GMSMutablePath()
//        rect.add(CLLocationCoordinate2D(latitude: latitude - latitudeMargin, longitude: longitude + longitudeMargin))
//        rect.add(CLLocationCoordinate2D(latitude: latitude + latitudeMargin, longitude: longitude + longitudeMargin))
//        rect.add(CLLocationCoordinate2D(latitude: latitude + latitudeMargin, longitude: longitude - longitudeMargin))
//        rect.add(CLLocationCoordinate2D(latitude: latitude - latitudeMargin, longitude: longitude - longitudeMargin))
//
//        let polygon = GMSPolygon(path: rect)
//        polygon.fillColor = UIColor(red: 0, green: 0.2, blue: 0, alpha: 0.3);
//        polygon.strokeColor = .clear
//        polygon.map = mapView
        
        
    }

    deinit {
      observation?.invalidate()
    }

}

extension MapViewController: GMSMapViewDelegate {
    

}
