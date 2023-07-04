//
//  Places.swift
//  Location Saver
//
//  Created by ahmed khaled on 04/07/2023.
//

import Foundation


class Places{
    static var shared = Places()
    var landmarks: [Landmark] = []
    
    private init(){}
}
