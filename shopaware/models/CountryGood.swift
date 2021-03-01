//
//  CountryGoods.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct CountryGood: Codable {
    public var id: String
    public var assessment_id: String
    public var year: String
    public var country_id: String
    public var country: String
    public var good_id: String
    public var good: String
    public var region_name: String
    public var child_labor: String
    public var forced_labor: String
    public var forced_child_labor: String
    
    init(id: String,
         assessment_id: String,
         year: String,
         country_id: String,
         country: String,
         good_id: String,
         good: String,
         region_name: String,
         child_labor: String,
         forced_labor: String,
         forced_child_labor: String) {
        self.id = id
        self.assessment_id = assessment_id
        self.year = year
        self.country_id = country_id
        self.country = country
        self.good_id = good_id
        self.good = good
        self.region_name = region_name
        self.child_labor = child_labor
        self.forced_labor = forced_labor
        self.forced_child_labor = forced_child_labor
        
    }
    
}
