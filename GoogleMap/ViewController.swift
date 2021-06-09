//
//  ViewController.swift
//  GoogleMap
//
//  Created by Ahmed Badawi on 09/06/2021.
//
import CoreLocation
import GoogleMaps
import UIKit

class ViewController: UIViewController,CLLocationManagerDelegate{

    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        GMSServices.provideAPIKey("AIzaSyCiCF5Yw8PywLqFVFWnl1ECXUTZGtxhZWM")
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        let coordinate = location.coordinate
        
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "My location"
        marker.icon = UIImage(named: "mario")!
        marker.map = mapView
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: 51.50998, longitude: -0.1337)
        marker1.title = "London"
        marker1.snippet = "UK"
        marker1.map = mapView
        // /////////////////////
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker2.title = "Sydney"
        marker2.snippet = "Australia"
        marker2.map = mapView
        // /////////////////////
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 40.759211, longitude: -73.984638)
        marker3.title = "New York"
        marker3.snippet = "USA"
        marker3.map = mapView
        // /////////////////////
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 35.7020691, longitude: 139.7753269)
        marker4.title = "Tokyo"
        marker4.snippet = "Japan"
        marker4.map = mapView
        view.addSubview(mapView)
    }
    
}



