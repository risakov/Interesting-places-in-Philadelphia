//
//  MapSightVC.swift
//  Philadelfiya
//
//  Created by Алексей Ляшенко on 7/29/19.
//  Copyright © 2019 Olexii Lyashenko. All rights reserved.
//
import MapKit
import UIKit

class MapSightVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
        @IBOutlet weak var mapkitView: MKMapView!
        @IBOutlet weak var nameLocationLabelOutlet: UILabel!
    
    let locationManager = CLLocationManager()
    
    var elementForDirection = placesStruct(name: "", textAbout: "", photo: "", latitude: "", longitude: "")
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapkitView.delegate = self
        mapkitView.showsScale = true
        mapkitView.showsPointsOfInterest = true
        mapkitView.showsUserLocation = true
        
        nameLocationLabelOutlet.text = elementForDirection.name
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }

        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let coor = mapkitView.userLocation.location?.coordinate{
            mapkitView.setCenter(coor, animated: true)
        }
        var sourceCoordinate = locationManager.location!.coordinate
        let destCoordinate = CLLocationCoordinate2D(latitude: Double(elementForDirection.latitude)!, longitude: Double(elementForDirection.longitude)!)
        mapkitView.setCenter(destCoordinate, animated: true)
        mapkitView.mapType = .standard
        mapkitView.isZoomEnabled = true
        mapkitView.isScrollEnabled = true
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
        let destPlacemark = MKPlacemark(coordinate: destCoordinate)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        sourceItem.name = "Your location"
        let deskItem = MKMapItem(placemark: destPlacemark)
        deskItem.name = elementForDirection.name
        
    }
    
}
