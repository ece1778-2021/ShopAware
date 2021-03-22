//
//  Brand.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-20.
//

import Foundation


class Brand:Codable
{
    public var name: String
    public var praises: [String]
    public var critisims: [String]
    public var information: [String]
    public var rating: String
    public var image_url: String
    
    init(name: String, praises: [String], critisims: [String], information: [String], rating: String, image_url: String) {
        self.name = name
        self.praises = praises
        self.critisims = critisims
        self.information = information
        self.rating = rating
        self.image_url = image_url
    }
    
    
}
