//
//  BrandHardcode.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import Foundation


class BrandHardcode: Codable, Hashable {
    static func == (lhs: BrandHardcode, rhs: BrandHardcode) -> Bool {
        return
            lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
    
    var name: String
    var logo: String
    var brands: [String]
    var report: String
    var lawsuits: [Lawsuit]
    var initiatives: [String]
    var ranking: String
    
    
    init(name: String, logo: String, brands: [String], report: String, lawsuits: [Lawsuit], initiatives: [String], ranking: String) {
        self.name = name
        self.logo = logo
        self.brands =  brands
        self.report = report
        self.lawsuits = lawsuits
        self.initiatives = initiatives
        self.ranking = ranking
    }
}


