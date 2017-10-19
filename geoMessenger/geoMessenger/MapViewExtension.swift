//
//  MapViewExtension.swift
//  geoMessenger
//
//  Created by Zach Budisch on 10/17/17.
//  Copyright © 2017 Zbudisch. All rights reserved.
//

import UIKit
import MapKit

extension FirstViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?) {
    if let annotation = annotation as? Message {
    let identifier = "Pin"
    var view: MKPinAnnotationView
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
    dequeuedView.annotation = annotation
    view = dequeued view
    } else {
    view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
    view.canShowCallout = true
    view.calloutOffset = CGPoint(x: 8, y: -5)
    view.pinTintColor = .green
    view.animatesDrop = true
    view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIButton
    }
    return view
    }
    return nil
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        let message = view.annotation as! Message
        let placeName = message.title
        let placeInfo = message.subtitle
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(title: "Ok", style: .default))
        ac.addAction(title: "remove", style: .default) {
            (result : UIAlertAction) -> Void in
            mapView.removeAnnotation(message)
        })
        
        present(ac, animated: true)
        
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 43.038611, longitude: -87.928759)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        let message = Message(title: "The Bucks are Legit!", locationName: "Bradley Center", username: "John Smith", coordinate: CLLocation(latitude: 43.038611, longitude: -87.928759), isDisabled: true))
        mapView.addAnnotation(message)
    }
}

