//
//  Territory.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Territory: Codable {
    public var id: String
    public var name: String
    public var abbreviation: String
    public var country: Country
    
    init(id: String, name: String, abbreviation: String, country: Country) {
        self.id = id
        self.name = name
        self.abbreviation = abbreviation
        self.country = country
    }
    
}
