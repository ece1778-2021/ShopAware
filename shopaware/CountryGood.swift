//
//  CountryGoods.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct CountryGood: Codable {
    public var id: String
    public var assessment: Assessment
    public var year: String
    public var country: Country
    public var good: Good
    public var region_name: String
    public var child_labor: String
    public var forced_labor: String
    public var forced_child_labor: String
    
    init(id: String,
         assessment: Assessment,
         year: String,
         country: Country,
         good: Good,
         region_name: String,
         child_labor: String,
         forced_labor: String,
         forced_child_labor: String) {
        self.id = id
        self.assessment = assessment
        self.year = year
        self.country = country
        self.good = good
        self.region_name = region_name
        self.child_labor = child_labor
        self.forced_labor = forced_labor
        self.forced_child_labor = forced_child_labor
        
    }
    
}
