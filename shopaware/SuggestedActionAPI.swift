//
//  SuggestedActions.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

struct SuggestedActionAPI: Codable {
    public var id: String
    public var assessment_id: String
    public var year: String
    public var country_id: String
    public var country: String
    public var area: String
    public var action: String
    
    init(id: String,
         assessment_id: String,
         year: String,
         country_id: String,
         country: String,
         area: String,
         action: String) {
        self.id = id
        self.assessment_id = assessment_id
        self.year = year
        self.country_id = country_id
        self.country = country
        self.area = area
        self.action = action
        
    }
    
}
