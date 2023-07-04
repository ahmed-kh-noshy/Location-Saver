//
//  SavedViewController.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import UIKit

class SavedViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SavedTableViewCell", bundle: nil), forCellReuseIdentifier: "savedCell")
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(true)
        tableView.reloadData()
        print(Places.shared.landmarks)
    }


    

}

extension SavedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Places.shared.landmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! SavedTableViewCell
        cell.name.text = Places.shared.landmarks[indexPath.row].name
        cell.desc.text = Places.shared.landmarks[indexPath.row].desc
        cell.time.text = DateFormatter.localizedString(from: Places.shared.landmarks[indexPath.row].time, dateStyle: .short, timeStyle: .short)
        return cell
    }
    
    
}
