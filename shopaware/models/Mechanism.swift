//
//  Mechanism.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct Mechanism: Codable {
    public var id: String
    public var assessment_id: String
    public var year: String
    public var country_id: String
    public var country: String
    public var coordination: String
    public var program: String
    public var policy: String
    
    init(id: String,
         assessment_id: String,
         year: String,
         country_id: String,
         country: String,
         coordination: String,
         program: String,
         policy: String,
         enforcement: String) {
        self.id = id
        self.assessment_id = assessment_id
        self.year = year
        self.country_id = country_id
        self.country = country
        self.coordination = coordination
        self.program = program
        self.policy = policy
    }
    
}
