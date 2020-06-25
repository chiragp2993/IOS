//
//  SI_DetailedViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 23/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import FaveButton
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class SI_DViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var SID_img: UIImageView!
    @IBOutlet weak var SID_lbl: UILabel!
    @IBOutlet weak var SID_desc: UILabel!
    @IBOutlet weak var starButton: FaveButton?
    @IBOutlet weak var SIDlatitude: UILabel!
    @IBOutlet weak var SIDlong: UILabel!
    @IBOutlet weak var SI_mapKit: MKMapView!
    
    let locationManager = CLLocationManager()
   

    var SI_title = String()
    var SI_image = UIImage()
    var SI_description = String()
    var SI_latitude = String()
    var SI_long = String()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SID_lbl.text=SI_title
        SID_img.image=UIImage(named: SI_title)
        SID_desc.text=SI_description
        SIDlatitude.text = SI_latitude
        SIDlong.text = SI_long
        
        
        SI_mapKit.delegate = self
        SI_mapKit.showsScale = true
        SI_mapKit.showsCompass = true
        SI_mapKit.showsUserLocation = true
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
        
        let sourceLocation = locationManager.location?.coordinate
        let destinationLocation = CLLocationCoordinate2D( latitude: (SI_latitude as NSString).doubleValue, longitude: (SI_long as NSString).doubleValue)
        let destinationPin = customPin(pinTitle: SI_title, pinSubTitle: "", location: destinationLocation)
        self.SI_mapKit.addAnnotation(destinationPin)
            
        let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation!)
        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
            
        let directionRequest = MKDirections.Request()
            directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
            directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
            directionRequest.transportType = .automobile
            
            let directions = MKDirections(request: directionRequest)
            directions.calculate { (response, error) in
                guard let directionResonse = response else {
                    if let error = error {
                        print("we have error getting directions==\(error.localizedDescription)")
                    }
                    return
                }
                
                let route = directionResonse.routes[0]
                self.SI_mapKit.addOverlay(route.polyline, level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.SI_mapKit.setRegion(MKCoordinateRegion(rect), animated: true)
            }
            
            self.SI_mapKit.delegate = self


        }
        
        //MARK:- MapKit delegates

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 4.0
            return renderer
        }
        
    
        
        
    }
    
    
    


   

