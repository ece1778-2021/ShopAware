//
//  Enforcement.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Enforcement: Codable {
    public var id: String
    public var assessment_id: String
    public var year: String
    public var country_id: String
    public var country: String
    public var territory_id: String
    public var territory_name: String
    public var name: String
    public var enforcement: String
    
    init(id: String,
         assessment_id: String,
         year: String,
         country_id: String,
         country: String,
         territory_id: String,
         territory_name: String,
         name: String,
         enforcement: String) {
        self.id = id
        self.assessment_id = assessment_id
        self.year = year
        self.country_id = country_id
        self.country = country
        self.territory_id = territory_id
        self.territory_name = territory_name
        self.name = name
        self.enforcement = enforcement
    }
    
}
