//
//  Landmark.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import Foundation
import RealmSwift

class Landmark: Object{
   @objc dynamic var name: String = ""
   @objc dynamic var desc: String = ""
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var lon: Double = 0.0
   @objc dynamic var time: Date = Date()
}
