//
//  Good.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct GoodAPI: Codable {
    public var id: String
    public var sector_id: String
    public var sector: String
    public var name: String
    
    init(id: String, sector_id: String, sector: String, name: String) {
        self.id = id
        self.sector_id = sector_id
        self.sector = sector
        self.name = name
    }
    
}
