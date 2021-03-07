//
//  Country.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation


struct Country: Codable {
    public var id: String
    public var name: String
    public var region: Region
    public var num_territories: String
    
    init(id: String, name: String, region: Region, num_territories: String) {
        self.id = id
        self.name = name
        self.region = region
        self.num_territories = num_territories
    }
    
}
