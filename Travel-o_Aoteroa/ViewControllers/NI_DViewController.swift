//
//  NI_DetailedViewController.swift
//  Travel-o_Aoteroa
//
//  Created by chirag patel on 20/04/20.
//  Copyright © 2020 chirag patel. All rights reserved.
//

import UIKit
import FaveButton
import MapKit

func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class NI_DViewController: UIViewController,FaveButtonDelegate, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var NI_mapKit: MKMapView!
    @IBOutlet weak var NID_img: UIImageView!
    @IBOutlet weak var NID_lbl: UILabel!
    @IBOutlet weak var NID_desc: UILabel!
    @IBOutlet weak var starButton: FaveButton?
    @IBOutlet weak var NID_latitude:UILabel!
    @IBOutlet weak var NID_long:UILabel!
    let locationManager = CLLocationManager()
    
    
        
    var NI_title = String()
    
    var NI_image = UIImage()
    var NI_description = String()
    var NI_latitude = String()
    var NI_long = String()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        NID_lbl.text=NI_title
        NID_img.image=UIImage(named: NI_title)
        NID_desc.text=NI_description
        NID_latitude.text=NI_latitude
        NID_long.text=NI_long
        
        NI_mapKit.delegate = self
        NI_mapKit.showsScale = true
        NI_mapKit.showsCompass = true
        NI_mapKit.showsUserLocation = true
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
        
            let sourceLocation = locationManager.location?.coordinate
            let destinationLocation = CLLocationCoordinate2D( latitude: (NI_latitude as NSString).doubleValue, longitude: (NI_long as NSString).doubleValue)
            let destinationPin = customPin(pinTitle: NI_title, pinSubTitle: "", location: destinationLocation)
            self.NI_mapKit.addAnnotation(destinationPin)
            
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
                self.NI_mapKit.addOverlay(route.polyline, level: .aboveRoads)
                
                let rect = route.polyline.boundingMapRect
                self.NI_mapKit.setRegion(MKCoordinateRegion(rect), animated: true)
            }
            
            self.NI_mapKit.delegate = self


        }
        
        //MARK:- MapKit delegates

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = UIColor.blue
            renderer.lineWidth = 4.0
            return renderer
        }
    
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool) {
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === starButton) {
            return colors
        }
        return nil
    }
        

}
