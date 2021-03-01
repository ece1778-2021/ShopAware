//
//  Assessment.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Assessment: Codable {
    public var id: String
    public var country: Country
    public var year: String
    public var advancement_level: AdvancementLevel
    public var description: String
    
    init(id: String, country: Country, year: String,advancement_level: AdvancementLevel, description: String) {
        self.id = id
        self.country = country
        self.year = year
        self.advancement_level = advancement_level
        self.description = description
    }
    
}
