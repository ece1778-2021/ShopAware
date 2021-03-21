//
//  Brand.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-20.
//

import Foundation


class Brand {
    public var name: String
    public var praises: [String]
    public var critisims: [String]
    public var information: [String]
    public var rating: String
    
    init(name: String, praises: [String], critisims: [String], information: [String], rating: String) {
        self.name = name
        self.praises = praises
        self.critisims = critisims
        self.information = information
        self.rating = rating
    }
    
    
}
