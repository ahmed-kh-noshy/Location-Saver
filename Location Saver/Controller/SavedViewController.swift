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
    

    

}

extension SavedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell", for: indexPath) as! SavedTableViewCell
        cell.name.text = "Egypt"
        cell.desc.text = "this is where i was born, this is where i was born, this is where i was born, this is where i was born, this is where i was born, this is where i was born"
        cell.time.text = "04:00 AM"
        return cell
    }
    
    
}
