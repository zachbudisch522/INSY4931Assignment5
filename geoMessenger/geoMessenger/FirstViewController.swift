//
//  FirstViewController.swift
//  geoMessenger
//
//  Created by Zach Budisch on 10/17/17.
//  Copyright © 2017 Zbudisch. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let initialLocation = CLLocation(latitude: 43.038611, longitude: -87.928759)
        centerMapOnLoacation(location: initialLocation)
        
        let message = Message(title: "The Bucks are Legit!", locationName: "Bradley Center", username: "John Smith", coordinate: CLLocationCoordinate2D(latitude: 43.043914, longitude: -87.917262), isDisabled: <#Bool#>)
        mapView.addAnnotation(message)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLoacation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        var locationManager = CLLocationManager()
        func checkLocationAuthorizationStatus() {
            if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
                mapView.showsUserLocation = true
            } else {
                locationManager.requestWhenInUseAuthorization()
            }
        }
        override func viewDidAppear(_ <#T##animated: Bool##Bool#>) {
            super.viewDidAppear(animated)
            checkLocationAuthorizationStatus()
        }
    }


}

