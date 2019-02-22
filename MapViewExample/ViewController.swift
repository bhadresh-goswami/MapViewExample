//
//  ViewController.swift
//  MapViewExample
//
//  Created by Mac on 22/02/19.
//  Copyright © 2019 bhadresh. All rights reserved.
//

import UIKit
import MapKit

import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var annotations = [MKPointAnnotation]()
    
    var clManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.sizeToFit()
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2D(latitude: 23.0225, longitude: 72.5714)
        
        annotations.append(annotation)
        mapView.addAnnotation(annotation)

        
        
        
//        var zoomRect = MKMapRectNull;
//        let myLocationPointRect = MKMapRectMake(23.0225, 72.5714, 0, 0)
//        //var currentDestinationPointRect = MKMapRectMake(currentDestination.longitude, currentDestination.latitude, 0, 0)
//
//        //zoomRect = myLocationPointRect;
//        zoomRect = MKMapRectUnion(zoomRect, myLocationPointRect);
//        mapView.setVisibleMapRect(zoomRect, animated: true)

        
        
        
        clManager = CLLocationManager()
        clManager?.delegate = self
        clManager?.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("i am at new location!")
        let newLocation = locations.last
        
        
//        let coordinates = CLLocationCoordinate2DMake((newLocation?.coordinate.latitude)!, newLocation?.coordinate.longitude)
        
        //mapView.removeAnnotations(annotations)
        
        let annotation = MKPointAnnotation()
        annotations.append(annotation)

        annotation.coordinate = CLLocationCoordinate2D(latitude: (newLocation?.coordinate.latitude)!, longitude: (newLocation?.coordinate.longitude)!)
        mapView.addAnnotation(annotation)
        let regionRadius: CLLocationDistance = 50000

        let coordinateRegion = MKCoordinateRegionMakeWithDistance((newLocation?.coordinate)!,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        
    }
    
}
