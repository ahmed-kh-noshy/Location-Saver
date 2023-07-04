//
//  MapViewController.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController {

    
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var descreptionTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var popUpView: UIView!

    @IBAction func showView(_ sender: Any) {
        popUpView.isHidden = false
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        popUpView.layer.cornerRadius = 24
        descreptionTextView.layer.cornerRadius = 15
        popUpView.isHidden = true
        
    }
    

    
}


extension MapViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations.last
        print(location!)
        let center = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
        map.showsUserLocation = true
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
    
}
