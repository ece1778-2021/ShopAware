//
//  Assessment.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct AssessmentAPI: Codable {
    public var id: String
    public var country_id: String
    public var country: String
    public var year: String
    public var advancement_level_id: String
    public var advancement_level: String
    public var description: String
    
    init(id: String, country_id: String, country: String, year: String, advancement_level_id: String, advancement_level: String, description: String) {
        self.id = id
        self.country_id = country_id
        self.country = country
        self.year = year
        self.advancement_level_id = advancement_level_id
        self.advancement_level = advancement_level
        self.description = description
    }
    
}
