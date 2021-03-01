//
//  Region.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Region: Codable {
    public var id: String
    public var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
}
