//
//  SavedTableViewCell.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import UIKit

class SavedTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
