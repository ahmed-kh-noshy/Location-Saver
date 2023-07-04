//
//  Places.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import Foundation
import RealmSwift

class Places{
    static var shared = Places()
    var landmarks: Results<Landmark>!
    var userLat: Double=0.0
    var userLon: Double=0.0
    private init(){}
}
