//
//  Country.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation


struct CountryAPI: Codable {
    public var id: String
    public var name: String
    public var region_id: String
    public var region: String
    public var num_territories: String
    
    init(id: String, name: String, region_id: String, region: String, num_territories: String) {
        self.id = id
        self.name = name
        self.region_id = region_id
        self.region = region
        self.num_territories = num_territories
    }
    
}
