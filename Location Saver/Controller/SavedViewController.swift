//
//  SavedViewController.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import UIKit
import MapKit
import CoreLocation
import RealmSwift
class SavedViewController: UIViewController {

    var realm = try! Realm()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "savedCell")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(true)
        let landmarkes = realm.objects(Landmark.self)
        Places.shared.landmarks = landmarkes
        tableView.delegate = self
        tableView.reloadData()
        //print(Places.shared.landmarks)
    }


    

}

extension SavedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.landmarks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! SavedTableViewCell
        cell.name.text = Places.shared.landmarks[indexPath.row].name
        cell.desc.text = Places.shared.landmarks[indexPath.row].desc
        cell.time.text = DateFormatter.localizedString(from: Places.shared.landmarks[indexPath.row].time, dateStyle: .short, timeStyle: .short)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let landmark = Places.shared.landmarks[indexPath.row]
        try! realm.write {
            realm.delete(landmark)
            }
        tableView.reloadData()
        }
    func handleSwipeToBack() {
      dismiss(animated: true, completion: nil)
    }
    
}

extension SavedViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let latitude:CLLocationDegrees =  Places.shared.landmarks[indexPath.row].lat
        let longitude:CLLocationDegrees =  Places.shared.landmarks[indexPath.row].lon
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                    ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        // mapItem.name = "\(self.venueName)"
        mapItem.openInMaps(launchOptions: options)
    }
}
