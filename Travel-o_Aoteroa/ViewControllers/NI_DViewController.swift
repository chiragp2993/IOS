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
        //locationManager.requestLocation()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let sourceCoord = locationManager.location?.coordinate
        //let sourceCoord = CLLocationCoordinate2D(latitude: -36.9530, longitude: 174.4688)
        let destCoord = CLLocationCoordinate2D( latitude: (NI_latitude as NSString).doubleValue, longitude: (NI_long as NSString).doubleValue)
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoord!)
        let destPlacemark = MKPlacemark(coordinate: destCoord)
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark: destPlacemark)
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
        directionRequest.transportType = .walking
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response,error in
             
            guard let response = response
            else
            {
                if let error = error {
                    print("wrong !!")
                }
                return
            }
            let route = response.routes[0]
            self.NI_mapKit.addOverlay(route.polyline, level: .aboveRoads)
            
            let rekt = route.polyline.boundingMapRect
            self.NI_mapKit.setRegion(MKCoordinateRegion(rekt), animated: true)
        
        })
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 253/255, green:
        127/255, blue: 82/255, alpha: 1)
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
