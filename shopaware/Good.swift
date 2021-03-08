//
//  Good.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Good: Codable {
    public var id: String
    public var sector: Sector
    public var name: String
    
    init(id: String, sector: Sector, name: String) {
        self.id = id
        self.sector = sector
        self.name = name
    }
}
