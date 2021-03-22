//
//  Lawsuit.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import Foundation

class Lawsuit: Codable {
    var name: String
    var link: String
    
    init(name: String, link: String) {
        self.name = name
        self.link = link
    }
}
